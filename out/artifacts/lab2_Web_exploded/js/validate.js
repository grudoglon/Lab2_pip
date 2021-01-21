window.addEventListener('load', function() {
        let coordsForm = document.getElementById('coordsForm');
        let floatNumberRegex = /^[-+]?[0-9]*[.,]?[0-9]+(?:[eE][-+]?[0-9]+)?$/;
        let yTooltip = document.getElementById('yTooltip');
        let buttons = document.querySelectorAll(".r_btn");
        let yCoordinate = document.getElementById('yCoordinate');
        let xCoordinate = document.getElementById('xCoordinate1');
        let radius = document.getElementById('radius');

        buttons.forEach(btn => {
            btn.addEventListener('click', event => {
                buttons.forEach(inner_btn => {inner_btn.classList.remove("btn-success");})
                btn.classList.add("btn-success");
                radius.value = btn.value;
            });
        });
        yCoordinate.addEventListener('input', function () {
            if (!floatNumberRegex.test(yCoordinate.value)) {
                yCoordinate.setCustomValidity('Неверный формат числа');
                yTooltip.innerHTML = 'Неверный формат числа';
            }
            else if (yCoordinate.value < -3 || yCoordinate.value > 3) {
                yCoordinate.setCustomValidity('Число не лежит в диапазоне');
                yTooltip.innerHTML = 'Число не лежит в диапазоне';
            }
            else {
                yCoordinate.setCustomValidity('');
                yTooltip.innerHTML = 'Введите значение';
            }
        }, false);

        coordsForm.addEventListener('submit', function(event) {
            yCoordinate.required = true;
            xCoordinate.required = true;
            radius.required = true;

            if (coordsForm.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
            coordsForm.classList.add('was-validated');
            }, false);
}, false);