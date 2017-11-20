app.Lines = function() {
    this._input = $('#lines-search-txt');
    this._initAutocomplete();
};

app.Lines.prototype = {
    _initAutocomplete: function() {
        this._input
            .autocomplete({
                source: '/lines/search',
                appendTo: '#lines-search-results',
                select: $.proxy(this._select, this),
            })
            .autocomplete('instance')._renderItem = $.proxy(this._render, this);
    },

    _render: function(ul, item) {
        var markup = [
            '<span class="img">'+ item.code + ' '+'</span>',
            // '<span class="title">' + item.code + '</span>',
            '<span class="author">' + item.itinerary + '</span>',
            // '<span class="price">'+'['+ item.company + ']' + '</span>'
        ];
        return $('<li>')
            .append(markup.join(''))
            .appendTo(ul);
    },

    _select: function(e, ui) {
        location.href = "/lines/"+ui.item.id;
        this._input.val(ui.item.code + ' - ' + ui.item.itinerary);
        return false;
    }
};
