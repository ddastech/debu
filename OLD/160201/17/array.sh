#!/bin/bash
Suites="Clubs
Diamonds
Hearts
Spades"

Denomination="2
3
4
5
6
7
8
9
10
Queen
King
Jack
Ace"

suite=($Suites)
denomination=($Denomination)
num_suites=${#suite[*]}
num_denominations=${#denomination[*]}
echo -n "${denomination[$((RANDOM%num_denominations))]} of "
echo ${suite[$((RANDOM%num_suites))]}
exit 0