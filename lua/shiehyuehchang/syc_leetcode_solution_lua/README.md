# Table of Contents
<!-- vim-markdown-toc GFM -->

* [Introdouction](#introdouction)
* [How to use this Library](#how-to-use-this-library)

<!-- vim-markdown-toc -->

## Introdouction

This project is a collection of
LeetCode solutions written in **lua**. The purpose of the project
is to practice **lua 5.4**, and track progress using **Git**.

Practice Reference: [Notes/Lua/Lua_Quick_Guide](https://github.com/medwatt/Notes/blob/main/Lua/Lua_Quick_Guide.ipynb)

## How to use this Library

* For example, if you install this project under *$HOME/path/to/this/project/*
  directory, create your user script, say *main.lua*:

  ```lua
  package.path = "$HOME/path/to/this/project/?.lua"
  local Solution = require "solution"

  local sol = Solution:new()

  print(sol:fib(1))
  print(sol:fib(2))
  print(sol:fib(3))
  ```
  
* Then execute the following commands:

  ```bash
  % lua main.lua
  ```
