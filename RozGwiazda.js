    /*window.onload = function(){
    var theDelay = 2;
    var timer = setInterval("changeColor()",theDelay*1000);
    }

    function changeColor(){
    currentColor = document.getElementById("background").getAttribute("fill");

    if(currentColor=="#3366ff")
    {
        pom.setAttribute("fill", "#f9c8060");
    }
    else
	    rect.setAttribute("fill", "#3366ff");
    }*/
    class Game {
        constructor(rows, cols, mines, container) {
            this.isActive = true;
            container.classList.remove('gameover');
            container.classList.remove('gamewon');
            this.rows = rows;
            this.cols = cols;
            this.mines = mines;
            this.container = container;
            this.mapGenerator();
            this.fill();
        }

        mapGenerator() {
            this.map = [];
            for (let i = 0; i < this.rows; i++) {
                let row = [];
                this.map.push(row);
                for (let j = 0; j < this.cols; j++) {
                    let cell = new Cell(i, j);
                    row.push(cell);
                }
            }
            let remainingBombs = this.mines;
            while (remainingBombs > 0) {
                let row = Math.floor(Math.random() * this.rows);
                let col = Math.floor(Math.random() * this.cols);
                if (!this.map[row][col].hasBomb) {
                    this.map[row][col].hasBomb = true;
                    remainingBombs--;
                }
            }
        }

        fill() {
            this.container.textContent = '';
            for (let row of this.map) {
                let rowPom = document.createElement('div');
                rowPom.className = 'row';
                this.container.appendChild(rowPom);
                for (let cell of row) {
                    let cellPom = document.createElement('div');
                    cellPom.className = 'cell';
                    cellPom.dataset.status = cell.status;
                    rowPom.appendChild(cellPom);
                    cellPom.onclick = () => {
                        this.open(cell);
                    };
                    cellPom.oncontextmenu = e => e.preventDefault();
                    cellPom.onmousedown = e => {
                        if (e.button === 2) {
                            this.flag(cell);
                            e.preventDefault();
                            e.stopPropagation();
                        }
                    }
                }
            }
        }

        open(cell) {
            if (!this.isActive) return;
            if (cell.status === 'clear') return;
            let cellPom = this.container.children[cell.row].children[cell.col];
            if (cell.hasBomb) {
                cellPom.dataset.status = 'mine';
                this.gameOver();
                return;
            }
            let number = this.calcBombsAround(cell);
            cell.status = 'clear';
            cellPom.dataset.status = 'clear';
            if (number === 0) {
                this.getCellNear(cell).forEach(x => this.open(x));
            } else {
                cellPom.textContent = number;
            }
            this.checkWin();
        }

        gameOver() {
            this.isActive = false;
            this.container.classList.add('gameover');
        }

        checkWin() {
            let remainingDefaults = 0;
            this.map.forEach(row => row.forEach(cell => {
                if (cell.status === 'default'||cell.status === 'flag') remainingDefaults++;
            }));
            if(remainingDefaults==this.mines){
                this.isActive = false;
                this.container.classList.add('gamewon');
            }
        }

        calcBombsAround(cell) {
            return this.getCellNear(cell).filter(x => x.hasBomb).length;
        }

        getCellNear(cell) {
            let ret = [];
            for (let i = -1; i <= 1; i++) {
                for (let j = -1; j <= 1; j++) {
                    if (this.map[cell.row + i] && this.map[cell.row + i][cell.col + j] && this.map[cell.row + i][cell.col + j] != cell) {
                        ret.push(this.map[cell.row + i][cell.col + j]);
                    }
                }
            }
            return ret;
        }

        flag(cell) {
            if (!this.isActive) return;
            let cellPom = this.container.children[cell.row].children[cell.col];

            if (cell.status === 'default') cell.status = 'flag';
            else if (cell.status === 'flag') cell.status = 'default';
            cellPom.dataset.status = cell.status;
        }
    }

    class Cell {
        constructor(row, col) {
            this.row = row;
            this.col = col;
            this.hasBomb = false;
            this.status = 'default';
        }
    }

    function latwy() {
        window.currentGame = new Game(10,10,15,document.querySelector('.game'));
    }

    function sredni() {
            window.currentGame = new Game(16,16,40,document.querySelector('.game'));
        }

    function trudny() {
            window.currentGame = new Game(20,20,69,document.querySelector('.game'));
        }