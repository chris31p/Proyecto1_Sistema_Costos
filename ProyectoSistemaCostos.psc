Algoritmo Sistema_Costos
    // Variables básicas
    Definir Producto, Destino Como Caracter
    Definir PrecioU, PrecioT, Iva, Dscto, CostoEnvio, CostoFinal, Subtotal, precioConDescuentoCantidad Como Real
    Definir CantidadArticulos, Peso, CostoEnvioXRegion Como Entero
    Definir CuponDscto, OtraCompra Como Caracter
    Definir TotalCompra Como Real
    Definir contador Como Entero
    
    // Dimensionar arreglos para almacenar los detalles de cada compra
    Dimension productos[10]
    Dimension precios[10]
    Dimension cantidades[10]
    Dimension descuentos[10]
    Dimension ivas[10]
    Dimension costosEnvio[10]
    Dimension costosFinales[10]
    
    TotalCompra <- 0
    contador <- 0
	
    //Utilizamos el bucle repetir para contabilizar las compras ingresadas por el usuario hasta que de por terminada la acción
    Repetir
        contador <- contador + 1
        
        Escribir "Ingrese el nombre del producto:"
        Leer productos[contador]
		
        Escribir "Ingrese el precio unitario:"
        Leer precios[contador]
		
        Escribir "Ingrese la cantidad a comprar:"
        Leer cantidades[contador]
		
        Escribir "Tiene cupón de descuento? (Si/No):"
        Leer CuponDscto
		
        Si CuponDscto == "Si" Entonces
            descuentos[contador] <- precios[contador] * 0.10
            precios[contador] <- precios[contador] * 0.90
            Escribir "Cupón: 10% de descuento"
        Sino
            descuentos[contador] <- 0
            Escribir "No tiene cupón de descuento"
        FinSi
		
		//Calcular el subtotal, además del impuesto del 12%
        Subtotal = precios[contador] * cantidades[contador]
        ivas[contador] = precios[contador] * 0.12
        PrecioT <- precios[contador] * 1.12
		
        // Calcular el descuento por cantidad, si aplica. Mediante el condicional si...entonces
        Si cantidades[contador] > 1 Entonces
            precioConDescuentoCantidad <- PrecioT * 0.95
        Sino
            precioConDescuentoCantidad <- PrecioT
        FinSi
		
        Escribir "Ingrese la región de destino (Norte, Centro, Sur): "
        Leer Destino
		
        // Determinar el costo de envío por región a través del condicional segun...hacer
        Segun Destino Hacer
            Caso "Norte":
                CostoEnvioXRegion <- 5 
            Caso "Centro":
                CostoEnvioXRegion <- 3
            Caso "Sur":
                CostoEnvioXRegion <- 7
            De Otro Modo:
                Escribir "Región no reconocida. Asignando costo de envío por defecto."
                CostoEnvioXRegion <- 4
        FinSegun
		
        Escribir "Ingrese el peso en kg:"
        Leer Peso
        // Calcular el costo de envío basado en el peso
        costosEnvio[contador] <- CostoEnvioXRegion + (Peso * 2)
		
        costosFinales[contador] = (precioConDescuentoCantidad * cantidades[contador]) + costosEnvio[contador]
		
        // Acumular el total de la compra
        TotalCompra <- TotalCompra + costosFinales[contador]
        
        Escribir "Desea realizar otra compra? (Si/No):"
        Leer OtraCompra
		
    Hasta Que OtraCompra = "No"
	
    // Mostrar el detalle de todas las compras realizadas
    Escribir "================ DETALLE DE COMPRAS ================"
    Para i <- 1 Hasta contador Con Paso 1 Hacer
        Escribir "Producto: ", productos[i]
        Escribir "Cantidad: ", cantidades[i]
        Escribir "Precio Unitario: $", precios[i] + descuentos[i]
        Escribir "Descuento aplicado: $", descuentos[i]
        Escribir "IVA (12%): $", ivas[i]
        Escribir "Costo de Envío: $", costosEnvio[i]
        Escribir "Costo Final: $", costosFinales[i]
        Escribir "------------------------------------------------"
    FinPara
    
    Escribir "EL PRECIO TOTAL DE SUS COMPRAS ES DE: $", TotalCompra
	Escribir "........ ¡Gracias por preferirnos! ........"	
	
	////Código de: Christopher Pesántez - DWFS C16
FinAlgoritmo
