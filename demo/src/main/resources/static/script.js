document.addEventListener('DOMContentLoaded', function() {
    fetch('/api/pacientes')
        .then(response => response.json())
        .then(pacientes => {
            const tableBody = document.getElementById('pacienteTable').getElementsByTagName('tbody')[0];
            pacientes.forEach(paciente => {
                let row = tableBody.insertRow();
                row.insertCell(0).innerHTML = paciente.cpf;
                row.insertCell(1).innerHTML = paciente.nome;
            });
        })
        .catch(error => console.error('Error:', error));
});


document.getElementById('addPacienteForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const formData = new FormData(this);
    const paciente = Object.fromEntries(formData.entries());

    fetch('/api/pacientes', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(paciente)
    })
    .then(response => response.json())
    .then(data => {
        console.log(data);
    })
    .catch(error => console.error('Error:', error));
});

