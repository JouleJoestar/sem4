#include <iostream>
#include <string>
#include <vector>
#include <chrono>
#include <fstream>
#include <cstdlib>

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
    long long comparisons = 0;
    long long cycles = 0;

    Arr(int k) {
        this->size = k;
        arr = new Material[k];
        indexes = new int[k];
        for (int i = 0; i < k; i++) {
            arr[i] = { i + 1, "2023-01-01", rand() % 10, rand() % 100, (double)(rand() % 100000) / 100.0 };
            indexes[i] = 1;
            cycles += 2;
        }
    }

    ~Arr() {
        delete[] arr;
        delete[] indexes;
    }
};

Material* FindByDetailCode(Arr* Obj, int code) {
    Obj->comparisons = 0;
    Obj->cycles += 2; 
    for (int i = 0; i < Obj->size; i++) {
        Obj->comparisons++;
        Obj->cycles += 4; 
        if (Obj->indexes[i] && Obj->arr[i].code == code) {
            return &Obj->arr[i];
        }
    }
    return nullptr;
}
//cортировка вставкой, изначальный вариант
void insertionSort(Arr* Obj) {
    Obj->comparisons = 0;
    Obj->cycles = 0;
    int n = Obj->size;
    Material* v = Obj->arr;
    for (int i = 1; i < n; i++) {
        Material key = v[i];
        int j = i - 1;

        while (j >= 0 && Obj->indexes[j] && v[j].cost > key.cost) {
            v[j + 1] = v[j];
            j--;
            Obj->comparisons++;
            Obj->cycles += 4;
        }
        v[j + 1] = key;
        Obj->cycles += 2;
    }
}
//бин поиск, изначальный вариант
int binarySearch(Arr* Obj, int key) {
    int low = 0;
    int high = Obj->size - 1;

    while (low <= high) {
        int mid = low + (high - low) / 2;

        Obj->comparisons++;
        Obj->cycles += 4;
        if (Obj->indexes[mid] && Obj->arr[mid].code == key) {
            return mid;  
        } else if (Obj->indexes[mid] && Obj->arr[mid].code < key) {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }

    return -1;  
}
//удаление маркировкой, изначальный вариант
void Delete(int index, Arr* Obj) {
    if (index >= 0 && index < Obj->size) {
        Obj->indexes[index] = 0;
        Obj->cycles += 2; 
    }
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
    vector<vector<string>> deleteResults = { {"Size", "Index", "Comparisons", "Cycles"} }; 

    for (int size : sizes) {
        Arr Obj(size);

        auto start = high_resolution_clock::now();
        insertionSort(&Obj);
        auto end = high_resolution_clock::now();
        sortResults.push_back({ to_string(size), to_string(duration_cast<milliseconds>(end - start).count()), to_string(Obj.comparisons), to_string(Obj.cycles) });

        Obj.comparisons = 0;
        Obj.cycles = 0;
        int searchKey = Obj.arr[size / 2].code;      
        start = high_resolution_clock::now();
        int index = binarySearch(&Obj, searchKey);
        end = high_resolution_clock::now();
        searchResults.push_back({ to_string(size), to_string(duration_cast<milliseconds>(end - start).count()), to_string(Obj.comparisons), to_string(Obj.cycles) });

        if (index != -1) {
            cout << index << endl; //резульат поиска 
        }

        int deleteIndex = size / 4; 
        start = high_resolution_clock::now();
        Delete(deleteIndex, &Obj);
        end = high_resolution_clock::now();
        deleteResults.push_back({ to_string(size), to_string(deleteIndex), to_string(Obj.comparisons), to_string(Obj.cycles) }); 
       
    }

    logResults("search_results.csv", searchResults);
    logResults("sort_results.csv", sortResults);
    logResults("delete_results.csv", deleteResults); 

    Material mat = {2, "2023-01-01", 2, 2, 2.0};

    cout << sizeof(mat) << endl;

    Arr emptyarr(0);
    cout << "Размер пустого Arr: " << sizeof(emptyarr) << " байт" << endl;

    return 0;
}
