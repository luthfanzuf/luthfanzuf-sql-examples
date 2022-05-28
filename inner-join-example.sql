	SELECT 
	mahasiswa.NIM,
	mahasiswa.Nama,
	MAX(Nilai_Angka) AS 'N. Tertinggi',
	MIN(Nilai_Angka) AS 'N. Terendah',
	AVG(Nilai_Angka) AS 'N.Rata-rata',
	COUNT(Kode_MK) AS 'Jumlah MK',
	COUNT(case 
				when Nilai_Huruf = 'A' then 1
				when Nilai_Huruf = 'B' then 1
				when Nilai_Huruf = 'C' then 1
			END) AS 'Jumlah MK Lulus',
	SUM(case
				when Nilai_Huruf = 'A' then 4*SKS
				when Nilai_Huruf = 'B' then 3*SKS
				when Nilai_Huruf = 'C' then 2*SKS
				when Nilai_Huruf = 'D' then 1*SKS
				when Nilai_Huruf = 'E' then 0*SKS
			END)/SUM(SKS) AS 'Total Nilai'
	FROM nilai
	INNER JOIN mahasiswa ON nilai.NIM = mahasiswa.NIM
	GROUP BY mahasiswa.NIM, mahasiswa.Nama