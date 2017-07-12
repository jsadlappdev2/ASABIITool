
function showtime() 
{ 
    var today,hour,second,minute,year,month,date; 
    var strDate ; 
    today=new Date(); 
    var n_day = today.getDay(); 
    switch (n_day) 
    { 
        case 0:{ 
            strDate = "Sunday" 
        }break; 
        case 1:{ 
            strDate = "Monday" 
        }break; 
        case 2:{ 
            strDate ="Tuesday" 
        }break; 
        case 3:{ 
            strDate = "Wednesday" 
        }break; 
        case 4:{ 
            strDate = "Thursday" 
        }break; 
        case 5:{ 
            strDate = "Friday" 
        }break; 
        case 6:{ 
            strDate = "Saturday" 
        }break; 
        case 7:{ 
            strDate = "Sunday" 
        }break; 
    } 
    year = today.getYear(); 
    month = today.getMonth()+1; 
    date = today.getDate(); 
    hour = today.getHours(); 
    minute =today.getMinutes(); 
    second = today.getSeconds(); 
    if(month<10) month="0"+month; 
    if(date<10) date="0"+date; 
    if(hour<10) hour="0"+hour; 
    if(minute<10) minute="0"+minute; 
    if(second<10) second="0"+second; 
    document.getElementById('time').innerHTML = year + "-" + month + "-" + date + "-" + strDate +" " + hour + ":" + minute + ":" + second; //显示时间 
    setTimeout("showtime();", 1000); //设定函数自动执行时间为 1000 ms(1 s) 
} 
