#!/usr/bin/env python3
# -*- coding: utf-8 -*-

' a gui module '

__author__ = 'ljk'


import tkinter as tk


def on_submit():
    print("Submitted!")

root = tk.Tk()
root.title("Basic Tkinter App")
root.geometry("600x400")

submit_button = tk.Button(root, text="Submit", command=on_submit)
submit_button.pack()

root.mainloop()

class MY_GUI():

# main
if __name__ == '__main__':
    pass