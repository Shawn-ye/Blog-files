#include <iostream>
#include <string>
#include <algorithm>
using namespace std;


// #define COMPILE_VERSION_1 1
#define COMPILE_VERSION_2 1
// #define COMPILE_VERSION_3 1

//  判定一个字符串是否是回文字符串


#ifdef COMPILE_VERSION_1
/*
    从头尾向中间收缩
*/
bool isPalindrome(string& a)    {
    int i = 0, j = a.length() - 1;
    while (i <= j)  {
        if (a[i] != a[j])
            return false;
        i ++;
        j --;
    }

    return true;
}
#endif


#ifdef COMPILE_VERSION_2
/*
    中间向两头扫描
*/
bool isPalindrome(string& a)    {
    int l = a.length();
    if (a.length() == 0)
        return true;
    
    int i = (l - 1) / 2, j = l / 2;

    while (i >= 0)  {
        if (a[i] != a[j])
            return false;
        i --;
        j ++;
    }

    return true;
}
#endif


int main()
{
    string a = "12221";
    if (isPalindrome(a))    
        cout << "true" << endl;
    else
        cout << "false" << endl;
    return 0;
}
