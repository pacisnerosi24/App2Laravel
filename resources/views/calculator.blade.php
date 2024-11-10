<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculadora Simple</title>
</head>
<body>
    <h1>Calculadora Simple</h1>
    <form action="/calculate" method="POST">
        @csrf
        <input type="number" name="num1" placeholder="Número 1" required>
        <select name="operation" required>
            <option value="add">Suma</option>
            <option value="subtract">Resta</option>
            <option value="multiply">Multiplicación</option>
            <option value="divide">División</option>
        </select>
        <input type="number" name="num2" placeholder="Número 2" required>
        <button type="submit">Calcular</button>
    </form>

    @if(isset($result))
        <h2>Resultado: {{ $result }}</h2>
    @endif
</body>
</html>
