/**
 * Gerencia o aumento e diminuiÃ§Ã£o das fontes do texto
 * @author Ana Carolina Fidelis GonÃ§alves
 */

function setBaseFontSizePlus() {

    var size = document.getElementById("ds-body");
    var style = window.getComputedStyle(size, null).getPropertyValue('font-size');
    var fontSize = parseFloat(style);
    size.style.fontSize = (fontSize + 5) + 'px';
    var size = document.getElementById("ds-body");
    var style = window.getComputedStyle(size, null).getPropertyValue('font-size');
    var fontSize = parseFloat(style);
    size.style.fontSize = (fontSize + 5) + 'px';

}

function setBaseFontSizeMinus() {
    var size = document.getElementById("ds-body");
    var style = window.getComputedStyle(size, null).getPropertyValue('font-size');
    var fontSize = parseFloat(style);
    size.style.fontSize = (fontSize - 5) + 'px';
    var size = document.getElementById("ds-footer");
    var style = window.getComputedStyle(size, null).getPropertyValue('font-size');
    var fontSize = parseFloat(style);
    size.style.fontSize = (fontSize - 5) + 'px';
}

function setBaseFontSize(sizeIndex) {
    document.getElementById("ds-body").style.font = sizeIndex + "px \"Helvetica Neue\",Helvetica,Arial,sans-serif";
    document.getElementById("ds-footer").style.font = "12px \"Helvetica Neue\",Helvetica,Arial,sans-serif";
}