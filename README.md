Reverse Polish Notation Calculator Lab
==================

We've probably all seen infix notation for arithmetic expressions, i.e. `(1+2)*3=9`. However there exists another way of writing these expressions in what is called *postfix notation* or *reverse polish notation*. For example, the follwing infix

    (1+2)*3

becomes the following in reverse polish notation
    
    1 2 + 3 *

where the binary operation follows the pair of values it should be applied to. Using this new notation we have to evaluate expressions correctly. This might be made easier with use of a new data structure, stack.

## Objective

* Implement a stack with the use of a linked list data structure
* Utilize stacks to manage values and applying binary operations
* Implement a fully functional postfix calculator 



## Setup A Stack

Using the linked list you've implemented today, create a `Stack` data structure that allows you to just `push` and `pop` items in and out of a collection respectively. Do not use a ruby array to implement the stack!  Also, make sure you get the specs to pass for the stack before moving on to the calculator.


## Operations to Manage

Your calculator should handle all arthemetic operations, i.e. `+`, `-`, `*`, `/`, and `^`. Here would be a good point to utilize case statements

## Reading Input

Data should be expected in lines of complete expressions that should be read from left to right. Input being read should be on the stack until an operation is read and two values are popped off to be evaluated. After reading terminates, only one value should be left on the stack, which should be popped off and returned as the result.

Rafi has also generously provided us with some postfix expressions to use for the purposes of testing our calculators abilities, [here](https://gist.githubusercontent.com/rsofaer/a437a66de6074bd5e1ab/raw/8c40374aac9cf6a5a00bb3eb8fed502e89fe467d/gistfile1.txt)

## BONUS

Write the calculator program such that if a command line argument for the file name is passed, then the file name is parse and evaluated.  Otherwise, make the program take a string from the user that is immediately parsed and displayed.
