def contar_lineas(archivo)
  count = 0
  File.open(archivo, 'r') { |f| count = f.readlines.map.count }
  count
end

puts contar_lineas('peliculas.txt')
