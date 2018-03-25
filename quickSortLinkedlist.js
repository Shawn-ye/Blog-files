function ListNode(val)  {
    this.val = val;
    this.next = null;
}
function genRandomArr() {
    let len = 12;
    let result = [];
    for (let i = 0; i < len; i++ )   {
        result.push(Math.floor(Math.random() * 1000));
    }
    return result;
}

function convArr2LinkedList(arr)    {
    let head = new ListNode(0), temp = head;

    while (arr.length)  {
        temp.next = new ListNode(arr.shift());
        temp = temp.next;
    }

    return head.next;
}

function printList(head)    {
    let string = "";
    while (head)    {
        string += (head.val) + " -> ";
        head = head.next;
    }
    console.log(string);
    return;
}

function swapListNode(p1, p2)   {
    let temp = p1.val;
    p1.val = p2.val;
    p2.val = temp;
    return;
}

function partitionLinkedList(head, tail)    {
    if (head === tail)  
        return head;
    let pivot = head.val;
    let p = head, q = head, pivotPos = head;

    while (q != tail)  {
        if (q.val < pivot)  {
            // console.log("switching ", p.val, q.val);
            if (p === pivotPos) {
                // console.log("p");
                pivotPos = q;
            } else if (q === pivotPos) {
                // console.log("q");
                pivotPos = p;
            }

            swapListNode(p, q);
            p = p.next;
        }
        q = q.next;
    }
    if (p != pivotPos)
        swapListNode(p, pivotPos);
    return p;
}

function quickSortLinkedList(list, head, tail)  {
    head = (head === undefined) ? list : head;
    tail = (tail === undefined) ? null : tail;
    if (head === tail)
        return head;
    
    let mid = partitionLinkedList(head, tail);
    quickSortLinkedList(list, head, mid);
    quickSortLinkedList(list, mid.next, tail);

    return list;
}

let list = convArr2LinkedList(genRandomArr());
console.log(quickSortLinkedList(list));

printList(list);