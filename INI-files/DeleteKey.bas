#define unicode
#include "windows.bi"

Const SectionUser = "Пользователь"
Const KeyUser = "Имя"

' Полный путь к файлу
Dim FileName As WString * (MAX_PATH + 1) = Any
FileName = ExePath() & "\configuration.ini"

' Функция возращает значение WinBool
Dim Result As WinBool = WritePrivateProfileString(SectionUser, KeyUser, NULL, FileName)
If Result Then
    Print "Параметр «Имя» удалён"
End If
