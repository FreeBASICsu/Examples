#define unicode
#include "windows.bi"

Const SectionUser = "Пользователь"

' Полный путь к файлу
Dim FileName As WString * (MAX_PATH + 1) = Any
FileName = ExePath() & "\configuration.ini"

' Функция возращает значение WinBool
Dim Result As WinBool = WritePrivateProfileString(SectionUser, NULL, NULL, FileName)
If Result Then
    Print "Секция «Пользователь» удалёна"
End If
