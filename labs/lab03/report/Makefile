all: report.pdf report.docx

report.pdf: report.md
	pandos report.md -o report.pdf

report.docx: report.md
	pandoc report.md -o report.docx

clean:
	rm -f report.pdf report.docx
