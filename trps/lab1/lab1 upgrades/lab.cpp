#include <iostream>
#include <string>
#include <vector>
#include <chrono>
#include <fstream>
#include <cstdlib>
#include <unordered_map>
#include <algorithm>

using namespace std;
using namespace chrono;

struct Material {
    int code;           
    string date;       
    int warehouse;      
    int quantity;       
    double cost;        
};

struct Arr {
    int size;
    Material* arr;
    int* indexes;
    unordered_map<int, Material*> hashTable; 
    long long comparisons = 0;
    long long cycles = 0;

    Arr(int k) {
        this->size = k;
        arr = new Material[k];
        indexes = new int[k];
        for (int i = 0; i < k; i++) {
            arr[i] = { rand() % 1000 + 1, "2023-01-01", rand() % 10, rand() % 100, (double)(rand() % 100000) / 100.0 };
            indexes[i] = 1;
            hashTable[arr[i].code] = &arr[i];
            cycles += 2;
        }
    }

    ~Arr() {
        delete[] arr;
        delete[] indexes;
    }
};

int partition(Material* arr, int low, int high, long long& comparisons, long long& cycles) {
    double pivot = arr[high].cost;
    cycles += 2;
    int i = low - 1;
    cycles += 2;
    for (int j = low; j < high; j++) {
        comparisons++;
        cycles += 4;
        if (arr[j].cost < pivot) {
            comparisons++;
            i++;
            cycles += 2;
            swap(arr[i], arr[j]);
            cycles += 3;
        }
    }
    swap(arr[i + 1], arr[high]);
    cycles += 3;
    return i + 1;
}

void quickSort(Material* arr, int low, int high, long long& comparisons, long long& cycles) {
    if (low < high) {
        int pi = partition(arr, low, high, comparisons, cycles);
        quickSort(arr, low, pi - 1, comparisons, cycles);
        quickSort(arr, pi + 1, high, comparisons, cycles);
    }
}

void quickSort(Arr* Obj) {
    quickSort(Obj->arr, 0, Obj->size - 1, Obj->comparisons, Obj->cycles);
}

Material* FindByDetailCode(Arr* Obj, int code, long long& comparisons, long long& cycles) {
    cycles += 2;
    auto it = Obj->hashTable.find(code);
    comparisons++;
    cycles += 2; 
    if (it != Obj->hashTable.end()) {
        return it->second; 
    }
    return nullptr; 
}

void logResults(const string& filename, const vector<vector<string>>& data) {
    ofstream file(filename);
    for (const auto& row : data) {
        for (size_t i = 0; i < row.size(); i++) {
            file << row[i];
            if (i < row.size() - 1) file << ",";
        }
        file << "\n";
    }
    file.close();
}

int main() {
    vector<int> sizes = { 10, 25, 100, 250, 500, 750, 1000, 2500, 5000, 7500, 10000 };
    vector<vector<string>> searchResults = { {"Size", "Time (ms)", "Comparisons", "Cycles"} };
    vector<vector<string>> sortResults = { {"Size", "Time (ms)", "Comparisons", "Cycles"} };

    for (int size : sizes) {
        Arr Obj(size);
        long long comparisons = 0;
        long long cycles = 0;

        auto start = high_resolution_clock::now();
        quickSort(&Obj);
        auto end = high_resolution_clock::now();
        sortResults.push_back({ to_string(size), to_string(duration_cast<milliseconds>(end - start).count()), to_string(Obj.comparisons), to_string(Obj.cycles) });

        comparisons = 0; 
        cycles = 0; 
        int searchKey = Obj.arr[size / 2].code;      
        start = high_resolution_clock::now();
        Material* foundMaterial = FindByDetailCode(&Obj, searchKey, comparisons, cycles);
        end = high_resolution_clock::now();
        if (foundMaterial) {
            cout << "Найден элемент с кодом " << searchKey << " на индексе " << (foundMaterial - Obj.arr) << endl;
        } else {
            cout << "Элемент с кодом " << searchKey << " не найден." << endl;
        }
        searchResults.push_back({ to_string(size), to_string(duration_cast<milliseconds>(end - start).count()), to_string(comparisons), to_string(cycles) });
    }

    logResults("search_results.csv", searchResults);
    logResults("sort_results.csv", sortResults);

        Arr emptyarr(1000);
    cout << "Размер Arr из 1000 элементов: " << sizeof(emptyarr) << " байт" << endl;

    return 0;
}
