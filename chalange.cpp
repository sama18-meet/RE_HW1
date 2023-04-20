#include <iostream>
#include <string>
#include <iomanip> 
using namespace std;
//int main(int argc, char** argv) {

int main() {
	string s;
	int resourses[5] = { 0 };
	int cost = 0;
	while (getline(cin, s)) {
		if (s.compare("road") == 0) {
			resourses[0]++;
			resourses[1]++;
		}
		if (s.compare("settlement") == 0) {
			resourses[0]++;
			resourses[1]++;
			resourses[2]++;
			resourses[3]++;
		}
		if (s.compare("city") == 0) {
			resourses[3] = resourses[3] + 2;
			resourses[4] = resourses[4] + 3;
		}

		if (s.compare("development") == 0) {
			resourses[2]++;
			resourses[3]++;
			resourses[4]++;
		}
	}
	for (int i = 0; i < 5; i++) {
		cout << setw(2) << setfill('0') << resourses[i] << " ";
		//cout << resourses[i] << " ";
	}
	cout << endl;
}

