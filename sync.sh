
for filename in `ls curated`; do
  helm package curated/${filename} -d archives/curated
done

for filename in `ls submitted`; do
  helm package submitted/${filename} -d archives/submitted
done