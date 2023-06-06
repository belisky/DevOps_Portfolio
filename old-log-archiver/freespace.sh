#!/bin/bash
function main(){
 
    freespace $@
}
function usage(){
    echo "Usage: $0 [-r RECURSIVELLY] [ -t TIME] [-f FOLDERNAME]" 1>&2;
}

function freespace(){
    day=24
    time=2    
    prefix="fc-"  
    r=false


#function to remove old files
    function remove_old_files(){
        find ${folderpath} -mtime +${time} -name "fc-*" -exec rm {} \;
    }

#function to compress files
    function compress(){
    find ${folderpath} -mtime -${time} -name *.log | while read file
    do
        if [ -f ${file} ]; then             
            new="$(dirname "$file")/$prefix$(basename "$file")";      
            tar -zcf $new.tar.gz $file;
            # rm -rf $file
 
        elif [ -d ${file} && r ]; then
            folderpath=$file;
            compress;
        elif [ file $file | grep -q compressed ]; then             
            new="$(dirname "$file")/$prefix$(basename "$file")";  
            mv $file $new;
            touch -am $new;
        else
            remove_old_files;
           
        fi
    done
}
 

    while getopts ':rt::f:' options;  do
            case $options in
                r) echo "freeing up space for subfolders too";r=true;;
                t) echo " time is not later than $OPTARG";time=$OPTARG/$day;;
                f) folderpath=$OPTARG;;
                \?) echo "Error: -$OPTARG requires an argument." 1>&2 ;usage;;
                *) usage;;
            esac
    done
    compress;
    shift $((OPTIND -1));   
 
}
 
main $@
