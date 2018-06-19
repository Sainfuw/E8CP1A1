def contar_palabras(archivo)
  file = []
  File.open(archivo, 'r') { |f| file = f.read }
  file.split.count
end

def contar_palabras2(archivo, palabra)
  file = []
  File.open(archivo, 'r') { |f| file = f.read }
  file.split.count(palabra)
end

puts contar_palabras('peliculas.txt')
puts contar_palabras2('peliculas.txt', 'Guerra')
