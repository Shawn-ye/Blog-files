#include <iostream>
#include <string>
#include <algorithm>
using namespace std;

// #define COMPILE_VERSION_1 1
// #define COMPILE_VERSION_2 1
#define COMPILE_VERSION_3 1

//  给定字符串A和B, 确定B的所有字母是否在A里面都存在.


#ifdef COMPILE_VERSION_1
/*
    最慢的:循环比较, 最坏情况下o(m*n)
*/
bool StringContain(string& a, string& b)    {
    for (int i = 0; i < b.size(); i ++)   {
        int j = 0;
        for (; j < a.size(); j++)     {
            if (a[j] == b[i])
                break;
        }

        if (j >= a.size())  {
            return false;
        }
    }

    return true;
}
#endif

#ifdef COMPILE_VERSION_2
/*
    先排序再比较, 排序分别耗时o(m * logm)和o(n * logn), 扫描耗时o(m+n)
*/
bool StringContain(string& a, string& b)    {
    sort(a.begin(), a.end());
    sort(b.begin(), b.end());

    for (int i = 0, j = 0; j < b.length(); j ++)   {
        while (i < a.length() && a[i] != b[j])  {
            i ++;
        }
        if (i >= a.length())    {
            return false;
        }
    }
    return true;
}
#endif

#ifdef COMPILE_VERSION_3
/*
    创建一个26bit的整数做hash表, 存在的字符被置1.
*/
bool StringContain(string& a, string& b)    {
    int hashTable = 0;
    for (int i = 0; i < a.length(); i ++)   {
        hashTable = hashTable | (0x80000000 >> (a[i] - 'a'));
    }
    for (int i = 0; i < b.length(); i ++)   {
        
        if ((hashTable & (0x80000000 >> (b[i] - 'a'))) == 0)  {
            return false;
        }
    }
    return true;
}
#endif



int main()
{
    cout << hex << (0x80000000 | 0x40000000) << endl;
    string a = "abcd";
    string b = "bce";

    if (StringContain(a, b))    {
        cout << "true" << endl;
    } else {
        cout << "false" << endl;
    }
    return 0;
}
