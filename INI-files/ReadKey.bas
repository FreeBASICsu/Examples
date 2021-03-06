#define unicode
#include "windows.bi"

Const SectionWindow = "Окно"
Const KeyWidth = "Width"
Const KeyHeight = "Height"
Const DefaultValue = "0"
Const BufferSize As Integer = 255

' Полный путь к файлу
Dim FileName As WString * (MAX_PATH + 1) = Any
FileName = ExePath() & "\configuration.ini"

' Значение из INI‐файла, которое мы получим
Dim Value As WString * (BufferSize + 1) = Any ' + 1 под завершающий нулевой символ

' Получить значение ключа Width
GetPrivateProfileString(SectionWindow, KeyWidth, DefaultValue, @Value, BufferSize, FileName)

Print KeyWidth; " = "; Value

' Получить значение ключа Height 
GetPrivateProfileString(SectionWindow, KeyHeight, DefaultValue, @Value, BufferSize, FileName)

Print KeyHeight; " = "; Value
