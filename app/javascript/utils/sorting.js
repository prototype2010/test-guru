document.addEventListener('turbolinks:load', () => {
    document
        .querySelectorAll('.sort-by-title')
        .forEach(node => node.addEventListener('click', sortByTableHeader))
});

const sortByTableHeader = (e) => {
    const currentNode = e.target
    const table = document.querySelector('table')
    const rows = table.querySelectorAll('tr')
    const headers = [...rows[0].querySelectorAll('th')]
    const sortHeaderIndex = headers.findIndex(header => header === currentNode);
    const dataRows = [...rows].slice(1, rows.length)
    const arrows = table.querySelectorAll('.octicon-arrow-up, .octicon-arrow-down')
    const sortAscArrow = currentNode.querySelector('.octicon-arrow-up')
    const sortDescArrow = currentNode.querySelector('.octicon-arrow-down')
    const isSortedDesc = !sortDescArrow.classList.contains('hide')

    arrows.forEach(arrow => arrow.classList.add('hide')) // removes sortings by other headers

    let nextDirection;

    if(isSortedDesc) {
        sortAscArrow.classList.remove('hide')
        sortDescArrow.classList.add('hide')
        nextDirection = 'asc'
    } else {
        sortAscArrow.classList.add('hide')
        sortDescArrow.classList.remove('hide')
        nextDirection = 'desc'
    }

    const sortedRows = sortTableRows(dataRows, sortHeaderIndex, nextDirection)
    const newTable = document.createElement('table')
    newTable.append(rows[0], ...sortedRows)
    newTable.classList.add(...table.classList)
    table.parentNode.replaceChild(newTable, table)
}

const sortTableRows = (rows, indexToSortBy, direction) => rows.sort((row1, row2) => {
    const row1Text = row1.querySelectorAll('td')[indexToSortBy].innerText
    const row2Text = row2.querySelectorAll('td')[indexToSortBy].innerText

    if(row1Text > row2Text) {
        return direction === 'asc' ? 1 : -1
    } else if(row1Text < row2Text) {
        return direction === 'asc' ? -1 : 1
    } else {
        return 0
    }
});
