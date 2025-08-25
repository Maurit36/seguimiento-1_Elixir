# Hace que el código de util.ex esté disponible
Code.require_file("util.ex", __DIR__)

# 1. Usa Util para pedirle a Java que muestre un diálogo de entrada
mensaje_original = Util.input_data("Escribe un mensaje:")

# 2. En Elixir, convierte el mensaje a mayúsculas
mensaje_en_mayuscula = String.upcase(mensaje_original)

# 3. Usa Util para pedirle a Java que muestre el resultado
Util.show_message(mensaje_en_mayuscula)
