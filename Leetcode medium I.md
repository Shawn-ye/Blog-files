---
title: Leetcode medium I
date: 2017-12-06 21:44:52
tags: 
---

#   Maximum Binary Tree
 Given an integer array with no duplicates. A maximum tree building on this array is defined as follow:

    The root is the maximum number in the array.
    The left subtree is the maximum tree constructed from left part subarray divided by the maximum number.
    The right subtree is the maximum tree constructed from right part subarray divided by the maximum number.

Construct the maximum tree by the given array and output the root node of this tree.

Example 1:
```
Input: [3,2,1,6,0,5]
Output: return the tree root node representing the following tree:

      6
    /   \
   3     5
    \    / 
     2  0   
       \
        1
```

Note:

    The size of the given array will be in the range [1,1000].

##  C++

```cpp
/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
vector<int> num;
bool compare(int x, int y)  {
    return num[x]>num[y];
}
class Solution {
public:
    TreeNode* constructMaximumBinaryTree(vector<int>& nums) {   
        TreeNode* root;
        int len = nums.size();
        vector<int> index(len);
        num = nums;
        for (int i = 0; i < len; i ++)  {
            index[i] = i;
        }
        sort(index.begin(), index.end(), compare);
        for (int i = 0; i < len; i ++)  {
            cout << index[i] << '\t';
        }
        return root;
    }
};

```


---
#   Encode and Decode TinyURL
TinyURL is a URL shortening service where you enter a URL such as ``https://leetcode.com/problems/design-tinyurl`` and it returns a short URL such as ``http://tinyurl.com/4e9iAk``.

Design the encode and decode methods for the TinyURL service. There is no restriction on how your encode/decode algorithm should work. You just need to ensure that a URL can be encoded to a tiny URL and the tiny URL can be decoded to the original URL.

##  C++
首先要明确一点，是找不到这样一个算法来完成压缩的效果的。长网址是一个无穷尽的集合，试图无损压缩并恢复，是不现实的。其次，试图建立一个合适的Hash函数也是徒劳的，因为进来的URL太多，无法预测碰撞情况。

我认为可行的办法只有一个，就是做一个62进制自增存储(a-z, A-Z, 0-9)。第一个人拿到的是0，第二个人拿到的是1，依次类推。
```cpp
class Solution {
public:
    // Encodes a URL to a shortened URL.
    string encode(string longUrl) {
        string shortUrl = currentkey;
        kv[currentkey] = longUrl;
        keyIncrease(currentkey);
        return shortUrl;
    }

    // Decodes a shortened URL to its original URL.
    string decode(string shortUrl) {
        return kv[shortUrl];
    }

    void keyIncrease(string& key)  {
        int i = key.size() - 1;
        while (true)    {
            switch (key[i]) {
                case '9':
                    key[i] = 'a';
                    break;
                case 'z':
                    key[i] = 'A';
                    break;
                case 'Z':
                    key[i] = '0';
                    break;
            }
            if (key[i] != '0')
                break;
            else
                i --;
        }
        return;
    }
private:
    map<string, string> kv;
    string currentkey = "000000";
};

// Your Solution object will be instantiated and called as such:
// Solution solution;
// solution.decode(solution.encode(url));
```


##  C++
![](/images/leetcode/535_rank0.png)
这种属于耍赖的算法，自然是最快的。
```cpp
class Solution {
public:
    // Encodes a URL to a shortened URL.
    string encode(string longUrl) {
        return longUrl;
    }

    // Decodes a shortened URL to its original URL.
    string decode(string shortUrl) {
        return shortUrl;
    }


};

// Your Solution object will be instantiated and called as such:
// Solution solution;
// solution.decode(solution.encode(url));
```