# 42-Libft
## Overview
42-Libft is a project that involves creating a library of various standard C functions, as well as additional utility functions. The purpose of this project is to strengthen your understanding of basic programming concepts and to provide you with a library that you can later use in other 42 school projects.

## Introduction
The libft library contains a variety of functions, including those for string manipulation, memory allocation, linked lists, and more. The goal is to create a library that can serve as a replacement for some of the standard C library functions.

## Library Functions
The library includes functions such as:

***Memory Functions:***
ft_memset, ft_bzero, ft_memcpy, ft_memmove, ft_memcmp

***String Functions:***
ft_strlen, ft_strdup, ft_strcpy, ft_strncpy, ft_strcat, ft_strncat, ft_strlcat, ft_strchr, ft_strrchr, ft_strstr, ft_strnstr, ft_strcmp, ft_strncmp, ft_striter, ft_striteri, ft_strmapi, ft_strjoin, ft_strtrim, ft_split

***Character Functions:***
ft_isalpha, ft_isdigit, ft_isalnum, ft_isascii, ft_isprint, ft_toupper, ft_tolower

***Numeric Functions:***
ft_itoa, ft_atoi

***Output Functions:***
ft_putchar_fd, ft_putstr_fd, ft_putendl_fd, ft_putnbr_fd
...and more.

## Usage
To use the libft library in your project, include the appropriate header file in your source code and link the compiled library during the compilation process.

## Example:

```bash
#include "libft.h"

int main() {
    ft_putstr("Hello, 42-Libft!\n");
    return 0;
}
```

## Compiling the Library
To compile the library, navigate to the project directory and run the make command.
```bash
make
```
This will generate the libft.a library file.

## Testing
***Check the functionality of the library functions with francinette.***
## Check here :: [Francinette](https://github.com/xicodomingues/francinette)
