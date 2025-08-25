Code.require_file("util.ex", __DIR__)

# 1. Pide al usuario que digite una palabra a través de un diálogo de Java
palabra = Util.input_data("Digita una palabra:")

# 2. Elixir calcula la longitud
longitud = String.length(palabra)

# 3. Crea el mensaje de respuesta
respuesta = "La palabra '#{palabra}' tiene #{longitud} letras."

# 4. Muestra la respuesta en un diálogo de Java
Util.show_message(respuesta)
