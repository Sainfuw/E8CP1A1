def existencia_x_producto(file)
  file.each do |line|
    arr = line.split(', ')
    name = arr.shift
    sum = arr.inject(0) { |acc, num| acc + num.to_i }
    puts "El #{name} tiene un total de: #{sum} elementos"
  end
end

def existencia_x_tienda(file)
  tiendas = file[0].split(', ').count - 1
  tiendas.times do |tienda|
    total = file.inject(0) { |acc, line| acc + line.split(', ')[tienda + 1].to_i }
    puts "Tienda#{i + 1} tiene un total de: #{total} elementos"
  end
end

def existencia_total(file)
  tiendas = file[0].split(', ').count - 1
  total = 0
  tiendas.times do |tienda|
    total += file.inject(0) { |acc, line| acc + line.split(', ')[tienda + 1].to_i }
  end
  puts "El total de productos en todas las tiendas es de: #{total}"
end

def check_if_exist(file, product)
  pos = -1
  file.each_with_index do |line, index|
    arr = line.split(', ')
    pos = index if arr[0].casecmp(product).zero?
  end
  pos
end

def sumar_productos(file, pos)
  file[pos].split(', ').inject(0) { |acc, num| acc + num.to_i }
end

def stock_total_producto(file)
  print 'Ingrese el producto a consultar: '
  product = gets.chomp
  pos = check_if_exist(file, product)
  if pos == -1
    puts 'El producto no existe'
  else
    puts "El stock total de #{product} es: #{sumar_productos(file, pos)}"
  end
end

def no_registrados_tienda(file)
  tiendas = file[0].split(', ').count - 1
  tiendas.times do |tienda|
    print "Tienda#{tienda + 1}: "
    file.each do |line|
      if line.split(', ')[tienda + 1] == 'NR'
        print "#{line.split(', ')[0]} no registrado, "
      end
    end
    print "\n"
  end
end

def por_agotarse(file)
  print 'Ingrese la cantidad maxima de productos a consultar: '
  max = gets.chomp.to_i
  file.each do |line|
    arr = line.split(', ')
    name = arr.shift
    sum = arr.inject(0) { |acc, num| acc + num.to_i }
    puts "El #{name} tiene un total de: #{sum} elementos" if sum < max
  end
end

def registrar_producto(file)
  newproduct = ''
  print 'Ingrese nombre del producto: '
  newproduct += gets.chomp
  tiendas = file[0].split(', ').count - 1
  tiendas.times do |tienda|
    print "Ingrese cantidad de productos para tienda#{tienda + 1}: "
    newproduct += ", #{gets.chomp}"
  end
  File.open('productos.txt', 'a') { |f| f.puts newproduct }
  puts 'Producto Agregado.'
end

opt = 0
while opt != 6
  file = []
  File.open('productos.txt', 'r') { |f| file = f.readlines.map(&:chomp) }
  puts "MENU\n*****************************"
  puts '1.- Cantidad de productos existentes'
  puts '2.- Stock total por producto'
  puts '3.- Productos no registrados por bodega'
  puts '4.- Consultar productos por agotarse'
  puts '5.- Registrar nuevo producto a las tiendas'
  puts '6.- Salir del programa'
  print 'Ingrese una opcion: '
  opt = gets.chomp.to_i
  case opt
  when 1
    opt2 = ''
    while opt2 != 'd'
      puts "Cantidad de productos existentes\n*****************************"
      puts 'a) Mostrar la existencia por productos.'
      puts 'b) Mostrar la existencia total por tienda.'
      puts 'c) Mostrar la existencia total en todas las tiendas.'
      puts 'd) Volver al menú principal.'
      print 'Ingrese una opcion: '
      opt2 = gets.chomp
      case opt2
      when 'a'
        existencia_x_producto(file)
      when 'b'
        existencia_x_tienda(file)
      when 'c'
        existencia_total(file)
      when 'd'
        opt2 = 'd'
      else
        puts 'Debe ingresar una opcion valida'
      end
    end
  when 2
    stock_total_producto(file)
  when 3
    no_registrados_tienda(file)
  when 4
    por_agotarse(file)
  when 5
    registrar_producto(file)
  when 6
    puts 'Programa terminado'
  else
    puts 'Debe Ingresar una opcion valida'
  end
end
