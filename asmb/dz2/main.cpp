#include <iostream>
#include <string>
#include <vector>
#include <cctype>
#include <algorithm>

using namespace std;

enum LexemType {
    procedure, function, var_token, const_token, id, type_token,
    lparen, rparen, colon, semicolon, comma, end_lexem
};

string lexemTypeToString(LexemType type) {
    switch (type) {
        case procedure: return "PROCEDURE";
        case function: return "FUNCTION";
        case var_token: return "VAR";
        case const_token: return "CONST";
        case id: return "IDENTIFIER";
        case type_token: return "TYPE";
        case lparen: return "'('";
        case rparen: return "')'";
        case colon: return "':'";
        case semicolon: return "';'";
        case comma: return "','";
        case end_lexem: return "END";
        default: return "UNKNOWN";
    }
}

struct Lexem {
    LexemType type;
    string value;
    size_t position;
};

string toLower(const string& s) {
    string result = s;
    transform(result.begin(), result.end(), result.begin(), ::tolower);
    return result;
}

class Lexer {
    string input;
    size_t pos;
    
    bool isType(const string& s) {
        static const vector<string> types = {
            "integer", "real", "char", "boolean", "byte",
            "shortint", "word", "longint", "cardinal", "string"
        };
        return find(types.begin(), types.end(), s) != types.end();
    }
    
public:
    Lexer(const string& input) : input(toLower(input)), pos(0) {}
    
    Lexem nextLexem() {
        while (pos < input.size() && isspace(input[pos])) pos++;
        if (pos >= input.size()) return {end_lexem, "", pos};
        
        size_t lexemStart = pos;
        
        if (input.substr(pos, 9) == "procedure") {
            pos += 9;
            return {procedure, "procedure", lexemStart};
        }
        if (input.substr(pos, 8) == "function") {
            pos += 8;
            return {function, "function", lexemStart};
        }
        if (input.substr(pos, 3) == "var") {
            pos += 3;
            return {var_token, "var", lexemStart};
        }
        if (input.substr(pos, 5) == "const") {
            pos += 5;
            return {const_token, "const", lexemStart};
        }
        
        size_t typeStart = pos;
        while (pos < input.size() && isalpha(input[pos])) pos++;
        string typeCandidate = input.substr(typeStart, pos - typeStart);
        
        if (!typeCandidate.empty() && isType(typeCandidate)) {
            return {type_token, typeCandidate, typeStart};
        }
        pos = typeStart;
        
        switch (input[pos]) {
            case '(': pos++; return {lparen, "(", lexemStart};
            case ')': pos++; return {rparen, ")", lexemStart};
            case ':': pos++; return {colon, ":", lexemStart};
            case ';': pos++; return {semicolon, ";", lexemStart};
            case ',': pos++; return {comma, ",", lexemStart};
        }
        
        if (isalpha(input[pos]) || input[pos] == '_') {
            size_t start = pos;
            while (pos < input.size() && (isalnum(input[pos]) || input[pos] == '_')) pos++;
            return {id, input.substr(start, pos - start), start};
        }
        
        throw runtime_error("Неизвестный токен '" + string(1, input[pos]) + 
                          "' в позиции " + to_string(pos));
    }
};

class Parser {
    Lexer& lexer;
    Lexem current;
    string currentName; 
    
    void eat(LexemType type) {
        if (current.type == type) {
            current = lexer.nextLexem();
        } else {
            string expected = lexemTypeToString(type);
            string actual = lexemTypeToString(current.type);
            string value = current.value.empty() ? "" : " '" + current.value + "'";
            
            throw runtime_error("В позиции " + to_string(current.position) + 
                             ": ожидалось " + expected + 
                             ", но найдено " + actual + value);
        }
    }
    
public:
    Parser(Lexer& lexer) : lexer(lexer), current(lexer.nextLexem()) {}
    
    void parse() {
        if (current.type == procedure) {
            parseProcedure();
            cout << "Процедура '" << currentName << "' распознана" << endl;
        } else if (current.type == function) {
            parseFunction();
            cout << "Функция '" << currentName << "' распознана" << endl;
        } else {
            throw runtime_error("Ожидалось PROCEDURE или FUNCTION в позиции " + 
                              to_string(current.position));
        }
        
        if (current.type != end_lexem) {
            throw runtime_error("Неожиданные токены после объявления в позиции " + 
                              to_string(current.position));
        }
    }
    
private:
    void parseProcedure() {
        eat(procedure);
        currentName = current.value; 
        eat(id);
        parseParams();
        eat(semicolon);
    }
    
    void parseFunction() {
        eat(function);
        currentName = current.value; 
        eat(id);
        parseParams();
        eat(colon);
        eat(type_token);
        eat(semicolon);
    }
    
    void parseParams() {
        if (current.type == lparen) {
            eat(lparen);
            parseParamList();
            eat(rparen);
        }
    }
    
    void parseParamList() {
        parseParam();
        while (current.type == semicolon) {
            eat(semicolon);
            parseParam();
        }
    }
    
    void parseParam() {
        if (current.type == var_token || current.type == const_token) {
            eat(current.type);
        }
        parseIdList();
        eat(colon);
        eat(type_token);
    }
    
    void parseIdList() {
        eat(id);
        while (current.type == comma) {
            eat(comma);
            eat(id);
        }
    }
};

int main() {
    string input;
    
    cout << "Ввод (для выхода - 'все'):" << endl;
    
    while (true) {
        cout << "> ";
        getline(cin, input);
        
        if (input == "все") {
            break;
        }
        
        if (input.empty()) {
            continue;
        }
        
        try {
            Lexer lexer(input);
            Parser parser(lexer);
            parser.parse();
        } catch (const exception& e) {
            cerr << "Обнаружена ошибка: " << e.what() << endl;
        }
        cout << "-------------------" << endl;
    }
    
    return 0;
}
