#define unicode
#include "windows.bi"

Const SectionUser = "Пользователь"
Const KeyUser = "Имя"
Const NewUserName = "Саша"

' Полный путь к файлу
Dim FileName As WString * (MAX_PATH + 1) = Any
FileName = ExePath() & "\configuration.ini"

' Функция возращает значение WinBool
Dim Result As WinBool = WritePrivateProfileString(SectionUser, KeyUser, NewUserName, FileName)
If Result Then
    Print "Запись удалась"
End If
