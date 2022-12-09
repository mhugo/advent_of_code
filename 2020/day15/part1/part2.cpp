#include <iostream>
#include <vector>

const int N = 30000000;

int turn_number[N];

int main() {
    //std::vector<int> input = {0, 3, 6};
    std::vector<int> input = {9, 19, 1, 6, 0, 5, 4};

    for (size_t i = 0; i < input.size() - 1; i++) {
        turn_number[input[i]] = i + 1;
    }

    int last_spoken = input[input.size() - 1];

    int n;
    for (int turn = input.size() + 1; turn < N + 1; turn++) {
        int last_turn = turn_number[last_spoken];
        turn_number[last_spoken] = turn - 1;
        n = 0;
        if (last_turn) {
            n = turn - 1 - last_turn;
        }
        last_spoken = n;
    }

    std::cout << n << std::endl;
    
    return 0;
}
