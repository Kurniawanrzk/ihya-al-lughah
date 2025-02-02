let prevButtonCheck = null;

function pilihOpsi(radio, btn) {
    document.getElementById(radio).checked = true;

    if(prevButtonCheck) {
        prevButtonCheck.disabled = false;
    } 
        btn.disabled = true;
        prevButtonCheck = btn;
    
}