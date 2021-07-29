# Fibonacci Series and Prime Check

### Aim

To generate the Fibonacci series for the given limit and display
for each number in the series if it is prime (or) composite.

### Algorithm

-   `dsiplay_fibonacci_series()` function

    -   Argument: variable `n` of integer data type.
    -   (a) Start
    -   (b) Read `n`.
    -   (c) Assign `-1` to `f` and `1` to `s`.
    -   (d) Perfom the following `n` times:
        -   (d.1) Compute `t` to be the sum of `f` and `s`
        -   (d.2) Assign `s` to `f`.
        -   (d.3) Assign `t` to `s`.
        -   (d.4) Call `prime_check()` function with `t` as argument.
    -   (e) Stop

-   `prime_check()` function
    -   Argument: variable `x` of type integer.
    -   (a) Start.
    -   (b) If `x` is `1` or `0`, print `Neither`. Go to step (e).
    -   (c) Run a loop with control variable taking values from `2` to `x-1`.
        -   (c.1) Check if any of the values of control variable is a factor of `x`
        -   (c.2) If it is a factor, go to step (d), else continue the loop.
    -   (d) If control had come out of step (c) because the loop was completed,
        print `Prime`, else print `Composite`.
    -   (e) Stop


### Output

```nim
                        FIBONACCI SERIES AND PRIME CHECK
                        --------- ------ --- ----- -----



        Enter number of Terms : 10

   Fibonacci Series                     Prime check
   --------- ------                     ----- -----

        0                       Neither Prime Nor Composite
        1                       Neither Prime Nor Composite
        1                       Neither Prime Nor Composite
        2                               Prime Number
        3                               Prime Number
        5                               Prime Number
        8                               Composite Number
        13                              Prime Number
        21                              Composite Number
        34                              Composite Number


Want to continue ? Press (1) then. 2
```
