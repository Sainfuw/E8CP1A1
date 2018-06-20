# Ejercicio1
def parrafos(dato1, dato2)
  file = File.open('index.html', 'w')
  file.puts("<p>#{dato1}</p>")
  file.puts("<p>#{dato2}</p>")
  file.close
end

# Ejercicio2
def parrafos2(dato1, dato2, arreglo)
  file = File.open('index2.html', 'w')
  file.puts("<p>#{dato1}</p>")
  file.puts("<p>#{dato2}</p>")
  unless arreglo.empty?
    file.puts('<ol>')
    file.puts(arreglo.map { |i| " <li>#{i}</li>" })
    file.puts('</ol>')
  end
  file.close
end

# Ejercicio3
def parrafos3(dato1, dato2, arreglo, bgcolor)
  file = File.open('index3.html', 'w')
  file.puts("<p style='background-color:#{bgcolor};'>#{dato1}</p>")
  file.puts("<p style='background-color:#{bgcolor};'>#{dato2}</p>")
  unless arreglo.empty?
    file.puts('<ol>')
    file.puts(arreglo.map { |i| " <li>#{i}</li>" })
    file.puts('</ol>')
  end
  file.close
end

arr = %w[test de arreglo en archivo]
parrafos('Hola Bienvenido', 'Emilio')
parrafos2('Hola Bienvenido', 'Emilio', arr)
parrafos3('Hola Bienvenido', 'Emilio', arr, 'yellow')
retorno = parrafos3('Hola Bienvenido', 'Emilio', arr, 'yellow')
if retorno.nil?
  puts 'Retorna nulo'
else
  puts 'Retorna algo'
end
