section .data

; Define the maximum allowed index
maxIndex dq 100

section .bss

arr resd 100 ; Reserve space for an array of 100 integers

section .text
  global _start

_start:
  ; Get the index from somewhere (e.g., user input or another part of the program) 
  ; ... (replace with your index fetching logic) ... 
  mov ecx, [index] ; Load the index into ecx

  ; Check for out-of-bounds index
  cmp ecx, [maxIndex]
  jg error_handler
  ;Check for negative index
  cmp ecx, 0
  jl error_handler

  ; Safe access to memory
  mov eax, ecx      ; ecx contains the index
  lea edx, [arr + eax*4] ; Calculate the address safely
  mov eax, [edx] ; Access the array element

  ; ... Rest of the program ...

  ; Exit the program
  mov eax, 1      ; sys_exit
  xor ebx, ebx    ; exit code 0
  int 0x80

error_handler:
  ; Handle the error appropriately (e.g., print an error message, exit with a non-zero code)
  ; ... (Add your error handling logic) ...
  mov eax, 1      ; sys_exit
  mov ebx, 1      ; exit code 1 (indicating error)
  int 0x80