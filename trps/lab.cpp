#include <iostream>
#include <vector>
#include <algorithm>

// Структура для хранения данных о материале
struct Material {
    int code;           // Код материала
    std::string date;   // Дата поступления
    int warehouse;      // Номер склада
    int quantity;       // Количество материала
    double cost;        // Стоимость
};

// Функция для двоичного поиска
int binarySearch(const std::vector<Material>& table, int key) {
    int low = 0;
    int high = table.size() - 1;

    while (low <= high) {
        int mid = low + (high - low) / 2;

        if (table[mid].code == key) {
            return mid;  // Найден элемент
        } else if (table[mid].code < key) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }

    return -1;  // Элемент не найден
}

// Функция для сравнения двух материалов по коду (для сортировки)
bool compareByCode(const Material& a, const Material& b) {
    return a.code < b.code;
}

int main() {
    // Создаем таблицу с данными
    std::vector<Material> table = {
        {103, "2023-03-01", 1, 200, 1000},
        {101, "2023-01-01", 1, 100, 500},
        {102, "2023-02-01", 2, 150, 750}
    };

    // Сортируем таблицу по коду материала
    std::sort(table.begin(), table.end(), compareByCode);

    // Выводим отсортированную таблицу
    std::cout << "Отсортированная таблица:" << std::endl;
    for (const auto& material : table) {
        std::cout << "Код: " << material.code << ", Дата: " << material.date
                  << ", Склад: " << material.warehouse << ", Количество: " << material.quantity
                  << ", Стоимость: " << material.cost << std::endl;
    }

    // Выполняем поиск по коду материала
    int key = 102;
    int index = binarySearch(table, key);

    if (index != -1) {
        std::cout << "Запись найдена: Код: " << table[index].code << ", Дата: " << table[index].date
                  << ", Склад: " << table[index].warehouse << ", Количество: " << table[index].quantity
                  << ", Стоимость: " << table[index].cost << std::endl;
    } else {
        std::cout << "Запись с кодом " << key << " не найдена." << std::endl;
    }

    return 0;
}
