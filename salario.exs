Code.require_file("util.ex", __DIR__)

defmodule CalculadoraSalarioGUI do
  @moduledoc """
  Solución para el Ejercicio 3: Cálculo de Salario Neto.

  Este módulo orquesta la interacción con el usuario a través de diálogos
  de Java para recolectar los datos de un empleado, calcular su salario
  neto con horas extra y mostrar el resultado final.
  """

  @doc """
  Punto de entrada principal. Ejecuta el flujo de pedir datos, calcular y mostrar resultado.
  """
  def run do
    # 1. Pide los tres datos, uno por uno, usando diálogos de Java
    nombre = Util.input_data("Nombre del empleado:")
    horas_str = Util.input_data("Horas trabajadas:")
    valor_hora_str = Util.input_data("Valor por hora:")

    # 2. La lógica de conversión y cálculo se hace en Elixir
    horas = String.to_integer(horas_str)
    valor_hora = parse_valor(valor_hora_str)
    neto = calcular_neto(horas, valor_hora)

    # 3. Formatea la respuesta final
    respuesta = "El salario neto de #{nombre} es: $#{:erlang.float_to_binary(neto, [decimals: 2])}"

    # 4. Le pide a Java que muestre el resultado final
    Util.show_message(respuesta)
  end

  @doc """
  Convierte un string a número, manejando tanto enteros como flotantes.
  """
  defp parse_valor(str) do
    try do
      String.to_float(str)
    rescue
      ArgumentError -> String.to_integer(str)
    end
  end

  @doc """
  Calcula el salario neto para un empleado que NO trabajó horas extra.
  """
  defp calcular_neto(horas, valor) when horas <= 160 do
    horas * valor
  end

  @doc """
  Calcula el salario neto para un empleado que SÍ trabajó horas extra.
  Las horas por encima de 160 se pagan al 125%.
  """
  defp calcular_neto(horas, valor) when horas > 160 do
    pago_base = 160 * valor
    pago_extra = (horas - 160) * (valor * 1.25)
    pago_base + pago_extra
  end
end

# Inicia la ejecución de nuestro módulo
CalculadoraSalarioGUI.run()
