#include <iostream>
#include <vector>
#include "list.h"

using namespace std;

// Функция для двоичного поиска
int binarySearch(const vector<Material>& table, int key) {
    int low = 0;
    int high = table.size() - 1;

    while (low <= high) {
        int mid = low + (high - low) / 2;

        if (table[mid].code == key) {
            return mid;  // результат поиска
        } else if (table[mid].code < key) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }

    return -1;  //материал не найден
}

// Функция для сортировки вставкой
void insertionSort(vector<Material>& table) {
    int n = table.size();
    for (int i = 1; i < n; i++) {
        Material key = table[i];
        int j = i - 1;

        while (j >= 0 && table[j].cost > key.cost) {
            table[j + 1] = table[j];
            j--;
        }
        table[j + 1] = key; 
    }
}

//удаление маркировкой
void deleteMaterial(vector<Material>& table, int code) {
    for (auto& material : table) {
        if (material.code == code) {
            material.code = 0; 
            material.date = "";  
	    material.warehouse = 0;
            material.quantity = 0;
            material.cost = 0.0;
            cout << "Материал с кодом " << code << " был удален." << endl;
            return;
        }
    }
   cout << "Материал с кодом " << code << " не найден." << endl;
}

int main() {

    vector<Material> table = getMaterials();  

    //проверка бинарного поиска
    int key;
    cout << "Введите код материала: ";
    cin >> key;

    int index = binarySearch(table, key);

    if (index != -1) {
        cout << "Запись найдена: Код: " << table[index].code << ", Дата: " << table[index].date
             << ", Склад: " << table[index].warehouse << ", Количество: " << table[index].quantity
             << ", Стоимость: " << table[index].cost << endl;
    } else {
        cout << "Запись с кодом " << key << " не найдена." << endl;
    }

    //удаляем материал
    int deleteKey;
    cout << "Введите код материала для удаления: ";
    cin >> deleteKey;
    deleteMaterial(table, deleteKey);

    //проверка сортировки(по цене)
    insertionSort(table);
    
    cout << endl;
    cout << "Отсортированный массив по стоимости:" << endl; 
    for (int i = 0; i < 10; i++) {
    // for (const auto& material : table) { // если вывести всё
	if (table[i].code != 0) { // проверка наличия материала(по коду)
        cout << "Код: " << table[i].code << ", Дата: " << table[i].date
             << ", Склад: " << table[i].warehouse << ", Количество: " << table[i].quantity
             << ", Стоимость: " << table[i].cost << endl;
    	}
    }

    std::string date = "2023-01-01"; 
    vector<int> test = {};
    size_t length = sizeof(date);
    int structlen = sizeof(test);	
    std::cout << length << " "<<structlen<<std::endl;

    return 0;
}
