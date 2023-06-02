$(document).ready(function () {
  const ctx1 = $("#chartCurahHujan")[0].getContext("2d");

  const chartCurahHujan = new Chart(ctx1, {
    type: "line",
    data: {
      datasets: [{ label: "Curah Hujan", }],
    },
    options: {
      borderWidth: 3,
      borderColor: ['rgba(255, 99, 132, 1)',],
      plugins: {
        zoom: {
          pan: {
            enabled: true
          },
          zoom: {
            wheel: {
              enabled: true,
            },
            pinch: {
              enabled: true
            },
            mode: 'xy',
          }
        }
      }
    },
  });

  function addDataCurahHujan(label, data) {
    chartCurahHujan.data.labels.push(label);
    chartCurahHujan.data.datasets.forEach((dataset) => {
      dataset.data.push(data);
    });
    chartCurahHujan.update();
  }

  $('#resetChartCurahHujan').on("click", function () {
    chartCurahHujan.resetZoom();
  });

  const ctx2 = $("#chartKecepatanAngin")[0].getContext("2d");

  const chartKecepatanAngin = new Chart(ctx2, {
    type: "line",
    data: {
      datasets: [{ label: "Kecepatan Angin", }],
    },
    options: {
      borderWidth: 3,
      borderColor: ['rgba(72, 113, 247, 1)',],
      plugins: {
        zoom: {
          pan: {
            enabled: true
          },
          zoom: {
            wheel: {
              enabled: true,
            },
            pinch: {
              enabled: true
            },
            mode: 'xy',
          }
        }
      }
    },
  });

  function addDataKecepatanAngin(label, data) {
    chartKecepatanAngin.data.labels.push(label);
    chartKecepatanAngin.data.datasets.forEach((dataset) => {
      dataset.data.push(data);
    });
    chartKecepatanAngin.update();
  }

  $('#resetChartKecepatanAngin').on("click", function () {
    chartKecepatanAngin.resetZoom();
  });

  const ctx3 = $("#chartArahAngin")[0].getContext("2d");

  const chartArahAngin = new Chart(ctx3, {
    type: "line",
    data: {
      datasets: [{ label: "Arah Angin", }],
    },
    options: {
      borderWidth: 3,
      borderColor: ['rgba(102, 204, 153, 1)',],
      plugins: {
        zoom: {
          pan: {
            enabled: true
          },
          zoom: {
            wheel: {
              enabled: true,
            },
            pinch: {
              enabled: true
            },
            mode: 'xy',
          }
        }
      }
    },
  });

  function addDataArahAngin(label, data) {
    chartArahAngin.data.labels.push(label);
    chartArahAngin.data.datasets.forEach((dataset) => {
      dataset.data.push(data);
    });
    chartArahAngin.update();
  }

  $('#resetChartArahAngin').on("click", function () {
    chartArahAngin.resetZoom();
  });

  const socket = io();

  const tableCurahHujan = $('#table-curah-hujan').DataTable();
  socket.on("updateCurahHujan", function (item) {
    $('#currentCurahHujan').html(item.value);
    addDataCurahHujan(item.date, item.value);
    tableCurahHujan.row.add([item.id, item.value, item.date]).draw();
  });

  socket.on('dataCurahHujan', function (data) {
    tableCurahHujan.clear().draw();

    data.forEach(function (item) {
      addDataCurahHujan(item[2], item[1]);
      tableCurahHujan.row.add([item[0], item[1], item[2]]).draw();
    });
  });

  const tableKecepatanAngin = $('#table-kecepatan-angin').DataTable();
  socket.on("updateKecepatanAngin", function (item) {
    $('#currentKecepatanAngin').html(item.value);
    addDataKecepatanAngin(item.date, item.value);
    tableKecepatanAngin.row.add([item.id, item.value, item.date]).draw();
  });

  socket.on('dataKecepatanAngin', function (data) {
    tableKecepatanAngin.clear().draw();

    data.forEach(function (item) {
      addDataKecepatanAngin(item[2], item[1]);
      tableKecepatanAngin.row.add([item[0], item[1], item[2]]).draw();
    });
  });

  const tableArahAngin = $('#table-arah-angin').DataTable();
  socket.on("updateArahAngin", function (item) {
    $('#currentArahAngin').html(item.value);
    addDataArahAngin(item.date, item.value);
    tableArahAngin.row.add([item.id, item.value, item.date]).draw();
  });

  socket.on('dataArahAngin', function (data) {
    tableArahAngin.clear().draw();

    data.forEach(function (item) {
      addDataArahAngin(item[2], item[1]);
      tableArahAngin.row.add([item[0], item[1], item[2]]).draw();
    });
  });
});