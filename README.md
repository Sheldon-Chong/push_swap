# push_swap
The push_swap program is designed to sort a stack of integers using only a limited set of operations, called "moves", while minimizing the total number of moves. The purpose of this project is to create an efficient-as-possible algorithm for sorting a stack, with the help of one additional stack. 

## 📖 Topics covered in push_swap
- Bits and bit-wise operators
- Linkedlists
- Sorting algorithms, Time complexity


## ⬇️ Clone
```
git clone git@github.com:Sheldon-Chong/push_swap.git
```


## ⏯️ Compile and run
```
make
./push_swap <list_of_numbers>
```

Example
```
./push_swap 5 3 2 1 4
```

Use the following to generate a random set of numbers quickly
```
shuf -i 1-100 -n 5
```

The program output prints each operation used sequentially, that lead to the numbers being sorted.

## ❓ Breaking down this project

Below are the maximum allowable moves for the following stack sizes:
- 3 integers: 3 moves or less 
- 5 integers: 12 moves or less 
- 100 integers: 700 moves or less
- 500 integers: 5,500 moves or less 
u
This project allows the following operations to be used to manipulate both stacks. Part of the project involves coding an implimentation for these operations
<table>
  <thead>
    <tr>
      <th>Operation</th>
      <th>Description</th>
      <th>Preview</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>sa</td>
      <td>Swap the position of the first two items in A</td>
      <td>
        A: <code>1, 2, 3, 4</code>
        <div align="center">⇩</div>
        A: <code>2, 1, 3, 4</code>
      </td>
    </tr>
    <tr>
      <td>sb</td>
      <td>Swap the position of the first two items in B</td>
      <td>
        B: <code>5, 6, 7, 8</code>
        <div align="center">⇩</div>
        B: <code>6, 5, 7, 8</code>
      </td>
    </tr>
    <tr>
      <td>ss</td>
      <td>Swap the first two items in A and B (Performs SA and SB)</td>
      <td>
        A: <code>1, 2, 3, 4</code><br>
        B: <code>5, 6, 7, 8</code>
        <div align="center">⇩</div>
        A: <code>2, 1, 3, 4</code><br>
        B: <code>6, 5, 7, 8</code>
      </td>
    </tr>
    <tr>
      <td>ra</td>
      <td>Rotate stack A to the left (1st item of stack A becomes last)</td>
      <td>
        A: <code>1, 2, 3, 4</code>
        <div align="center">⇩</div>
        A: <code>2, 3, 4, 1</code>
      </td>
    </tr>
    <tr>
      <td>rb</td>
      <td>Rotate stack B to the left (1st item of stack B becomes last)</td>
      <td>
        B: <code>5, 6, 7, 8</code>
        <div align="center">⇩</div>
        B: <code>6, 7, 8, 5</code>
      </td>
    </tr>
    <tr>
      <td>rr</td>
      <td>Rotate stack A and B to the left (Performs ra and rb)</td>
      <td>
        A: <code>1, 2, 3, 4</code><br>
        B: <code>5, 6, 7, 8</code>
        <div align="center">⇩</div>
        A: <code>2, 3, 4, 1</code><br>
        B: <code>6, 7, 8, 5</code>
      </td>
    </tr>
    <tr>
      <td>rra</td>
      <td>Rotate stack A to the right (last item of stack A becomes 1st)</td>
      <td>
        A: <code>1, 2, 3, 4</code>
        <div align="center">⇩</div>
        A: <code>4, 1, 2, 3</code>
      </td>
    </tr>
    <tr>
      <td>rrb</td>
      <td>Rotate stack B to the right (last item of stack B becomes 1st)</td>
      <td>
        B: <code>5, 6, 7, 8</code>
        <div align="center">⇩</div>
        B: <code>8, 5, 6, 7</code>
      </td>
    </tr>
    <tr>
      <td>rrr</td>
      <td>Rotate stack A and B to the right (Performs rra and rrb)</td>
      <td>
        A: <code>1, 2, 3, 4</code><br>
        B: <code>5, 6, 7, 8</code>
        <div align="center">⇩</div>
        A: <code>4, 1, 2, 3</code><br>
        B: <code>8, 5, 6, 7</code>
      </td>
    </tr>
    <tr>
      <td>pa</td>
      <td>Move the 1st item of B to the start of A</td>
      <td>
        A: <code>1, 2, 3, 4</code><br>
        B: <code>5, 6, 7, 8</code>
        <div align="center">⇩</div>
        A: <code>5, 1, 2, 3, 4</code><br>
        B: <code>6, 7, 8</code>
      </td>
    </tr>
    <tr>
      <td>pb</td>
      <td>Move the 1st item of A to the start of B</td>
      <td>
        A: <code>1, 2, 3, 4</code><br>
        B: <code>5, 6, 7, 8</code>
        <div align="center">⇩</div>
        A: <code>2, 3, 4</code><br>
        B: <code>1, 5, 6, 7, 8</code>
      </td>
    </tr>
  </tbody>
</table>

Additionally, for the bonus section of this project, I had to create a tester program that takes the operations printed by pushswap, and verifies if it actually sorts the output, by executing the operations itself. It works as a way to validate whether your program's output of operations were correct. 

## My experience with this project

For my sorting algorithm, I utilized radix sort, which is a relatively straightforward algorithm, yet is very effective at sorting a large set of numbers. 

Radix sort is typically conducted using base-10 numbers (0-9). However, for the case of radix sorting using 2 stacks, it meant I had only 2 buckets to sift between numbers. Hence, what I regard as the main challenge was brushing up on my knowledge of binary and binary operators for manipulation and comparisons, and adapting this approach to radix sort. Essentially, it was a matter of converting base10 to base2.
