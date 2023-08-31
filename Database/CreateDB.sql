IF NOT EXISTS (SELECT name FROM master.sys.databases WHERE name = N'BusinessApp')
BEGIN
	CREATE DATABASE BusinessApp
END