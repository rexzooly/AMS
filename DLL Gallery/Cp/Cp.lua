--StringConvert(cp.dll)

-- ���� � cp.dll
sPathDll = "AutoPlay\\Docs\\cp.dll";

-- ������� ��������������� ������ �� ����� ��������� � ������
function Convert(sStr, nInCp, nOutCp)
	return  DLL.CallFunction(sPathDll, "Convert", "\""..sStr.."\","..nInCp..","..nOutCp, DLL_RETURN_TYPE_STRING, DLL_CALL_STDCALL)
end