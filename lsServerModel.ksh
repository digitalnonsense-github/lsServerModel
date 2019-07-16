# Get server make and model

OStype=$(uname -s)
ServerName=$(uname -n)

if [[ $OStype = "AIX" ]]
  then HWmake=IBM
       HWmodel=`prtconf | grep "System Model" | awk -F, '{print $2}'`
       HWarch=`prtconf | grep "Processor Type" | awk -F, '{print $2}' | cut -c 2-`
fi

if [[ $OStype = "Linux" ]]
  then HWmake=`dmidecode -s system-manufacturer`
       HWmodel=`dmidecode -s system-product-name`
fi

if [[ $OStype = "SunOS" ]]
  then HWmake=`prtdisg | grep "System Configuration"`
fi

echo "${ServerName},${HWmake},${HWmodel}.${HWarch}" 
