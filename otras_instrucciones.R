plot(apply(sn, c(2,3), median)[, lim + 1], type = 'l')
obs <- dataMex[FECHA_INGRESO > datTod - lim - 5, .N, by = .(FECHA_INGRESO)][order(FECHA_INGRESO)]
points(obs, col = 'red')


plot(n[, 2], type = 'l')
points(obs, col = 'red')

plot(n[, lim + 1], type = 'l')
points(obs, col = 'red')

datPlo <- allDat[RESULTADO != "Sospechoso", .N, by = .(FECHA_ACTUALIZACION, RESULTADO)]
test <- dcast(datPlo, FECHA_ACTUALIZACION ~ RESULTADO, value.var = "N")[, Ratio := Positivo / (Positivo + Negativo)]


condiciones = c("DIABETES", "EPOC", "ASMA", "INMUSUPR", "HIPERTENSION", "OTRA_COM", "CARDIOVASCULAR", "OBESIDAD", "RENAL_CRONICA", "TABAQUISMO")

for(cond in condiciones){
  print(cond)
  print("Muertes")
  print(dataMex[!is.na(FECHA_DEF) & RESULTADO == "Positivo" & get(cond) == 1, .N])
  print("Letalidad")
  print(round(dataMex[!is.na(FECHA_DEF) & RESULTADO == "Positivo" & get(cond) == 1, .N] / 
          dataMex[RESULTADO == "Positivo" & get(cond) == 1, .N], 4) * 100 )
}
print("Ninguna")
print(dataMex[!is.na(FECHA_DEF) & RESULTADO == "Positivo" & 
                !(DIABETES == 1 | EPOC == 1 | ASMA == 1 | INMUSUPR == 1 | HIPERTENSION == 1 |
                   OTRA_COM == 1 | CARDIOVASCULAR == 1 | OBESIDAD == 1 | RENAL_CRONICA == 1 | TABAQUISMO == 1), .N] / dataMex[RESULTADO == "Positivo" & 
                                                                                                                                !(DIABETES == 1 | EPOC == 1 | ASMA == 1 | INMUSUPR == 1 | HIPERTENSION == 1 |
                                                                                                                                    OTRA_COM == 1 | CARDIOVASCULAR == 1 | OBESIDAD == 1 | RENAL_CRONICA == 1 | TABAQUISMO == 1), .N])


datPlo <- allDat[RESULTADO == "Sospechoso" & ENTIDAD_UM == 9, .N, by = .(FECHA_ACTUALIZACION)]

print("% de Casos Positivos con UCI")
dataMex[RESULTADO == "Positivo" & UCI == 1, .N] / dataMex[RESULTADO == "Positivo", .N] * 100
print("% de Casos Positivos sin UCI")
dataMex[RESULTADO == "Positivo" & UCI == 2, .N] / dataMex[RESULTADO == "Positivo", .N] * 100
print("% de Casos Positivos sin UCI (No Aplica)")
dataMex[RESULTADO == "Positivo" & UCI == 97, .N] / dataMex[RESULTADO == "Positivo", .N] * 100
print("% de Casos Positivos Se Ignora UCI")
dataMex[RESULTADO == "Positivo" & UCI == 98, .N] / dataMex[RESULTADO == "Positivo", .N] * 100
print("% de Casos Positivos Sin Espicificar UCI")
dataMex[RESULTADO == "Positivo" & UCI == 98, .N] / dataMex[RESULTADO == "Positivo", .N] * 100

print("% de Muertes con UCI")
dataMex[RESULTADO == "Positivo" & UCI == 1 & !is.na(FECHA_DEF), .N] / dataMex[RESULTADO == "Positivo" & !is.na(FECHA_DEF), .N] * 100
dataMex[RESULTADO == "Positivo" & UCI == 2 & !is.na(FECHA_DEF), .N] / dataMex[RESULTADO == "Positivo" & !is.na(FECHA_DEF), .N] * 100
dataMex[RESULTADO == "Positivo" & UCI == 97 & !is.na(FECHA_DEF), .N] / dataMex[RESULTADO == "Positivo" & !is.na(FECHA_DEF), .N] * 100
dataMex[RESULTADO == "Positivo" & UCI == 98 & !is.na(FECHA_DEF), .N] / dataMex[RESULTADO == "Positivo" & !is.na(FECHA_DEF), .N] * 100
dataMex[RESULTADO == "Positivo" & UCI == 99 & !is.na(FECHA_DEF), .N] / dataMex[RESULTADO == "Positivo" & !is.na(FECHA_DEF), .N] * 100
