SELECT 
nilai.Kode_Mk,
nilai.Nama_Mk,
COUNT(case
			when Nilai_Huruf = 'A' then 1
			when Nilai_Huruf = 'B' then 1
		END) AS 'Jumlah Mahasiswa Yang Mendapat Nilai A dan B',
		SUM(CASE
		WHEN EXISTS (SELECT mahasiswa.NIM FROM mahasiswa WHERE mahasiswa.umur >19 AND mahasiswa.Umur < 23 AND mahasiswa.NIM IN (SELECT nilai.NIM FROM nilai))
 THEN Nilai_Angka
		WHEN EXISTS (SELECT mahasiswa.NIM FROM mahasiswa WHERE mahasiswa.umur >19 AND mahasiswa.Umur < 23 AND mahasiswa.NIM IN (SELECT nilai.NIM FROM nilai))
 THEN Nilai_Angka
	END)/COUNT(CASE
		WHEN EXISTS (SELECT mahasiswa.NIM FROM mahasiswa WHERE mahasiswa.umur >19 AND mahasiswa.Umur < 23 AND mahasiswa.NIM IN (SELECT nilai.NIM FROM nilai))
 THEN Nilai_Angka
		WHEN EXISTS (SELECT mahasiswa.NIM FROM mahasiswa WHERE mahasiswa.umur >19 AND mahasiswa.Umur < 23 AND mahasiswa.NIM IN (SELECT nilai.NIM FROM nilai))
 THEN Nilai_Angka
	END) AS 'Nilai Rata-rata Pada Mahasiswa yang berumur Lebih dari 20 dan kurang dari 22'

FROM nilai
WHERE Kode_MK = 'MKA' OR Kode_MK = 'MKC'
GROUP BY nilai.Kode_Mk, nilai.Nama_Mk;