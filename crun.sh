#!/bin/bash
clear 
opr=0

while [ $opr -ne 8 ]; do
    echo "-----------------------------"
    echo "1. Run"
    echo "2. Edit code"
    echo "3. New file"
    echo "4. Rename file"
    echo "5. Delete file"
    echo "6. Copy file"
    echo "7. List files"
    echo "8. Exit"
    echo "-----------------------------"

    read -p "Select an option: " opr

    case $opr in
        1)
            clear
            echo "----------------------"
            ls
	    echo "----------------------"
            read -p "Enter the C file to compile and run: " file_run
            if [ -f "$file_run" ]; then
        clear
		figlet output
        echo "file ==> $file_run"
		echo "---------------------"
                gcc "$file_run" -o outputFile
                ./outputFile
                rm outputFile
            else
                echo "File '$file_run' not found."
            fi
            echo "----------------------"
            ;;
        2)
            clear
	    echo "----------------------"
            ls
	    echo "----------------------"
	    read -p "Enter the file name: " file_edit
            if [ -f "$file_edit" ]; then
                nano "$file_edit"
            else
                echo "File '$file_edit' not found."
            fi
            ;;
        3)
            clear
            echo "----------------------"
            ls
            echo "----------------------"
            read -p "Enter the file name: " file_name
            touch "$file_name"
            echo "Your file was created"
            echo "----------------------"
            ls
            echo "----------------------"
            ;;
        4)
            clear
            echo "----------------------"
            ls
            echo "----------------------"
            read -p "Enter the current file name: " old_file
            if [ -f "$old_file" ]; then
                read -p "Enter the new file name: " new_file
                mv "$old_file" "$new_file"
                echo "File '$old_file' renamed to '$new_file'"
                echo "----------------------"
                ls
                echo "----------------------"
            else
                echo "File '$old_file' not found."
            fi
            ;;
        5)
            clear
            echo "----------------------"
	        ls
            echo "----------------------"
            read -p "Enter the name of the file you want to delete: " file_del
            if [ -f "$file_del" ]; then
                rm "$file_del"
                echo "File '$file_del' deleted."
            else
                echo "File '$file_del' not found."
            fi
            echo "----------------------"
            ls
            echo "----------------------"
            ;;
        6)
            clear
            echo "----------------------"
            ls
            echo "----------------------"
            read -p "Enter the name of the file you want to copy: " file_copy
            if [ -f "$file_copy" ]; then
                read -p "Enter the new name for the copied file: " file_copy_new
                cp "$file_copy" "$file_copy_new"
                echo "File '$file_copy' copied to '$file_copy_new'"
                ls
            else
                echo "File '$file_copy' not found."
            fi
            echo "----------------------"
            ;;
        7)
            clear
            echo "----------------------"
            ls
            echo "----------------------"
            ;;
        8)
            clear
            echo "Exiting the script..."
            ;;
        *)
            clear
            echo "Invalid input. Please try again."
            ;;
    esac

done
