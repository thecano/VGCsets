

$(document).ready(function() {
var pokemons = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  remote: {
      url: '/suggestions'
    }
});
 
// kicks off the loading/processing of `local` and `prefetch`
pokemons.initialize();
// passing in `null` for the `options` arguments will result in the default
// options being used

//'#prefetch .typeahead'
$('input.typeahead').typeahead(
    {
      hint: true,
      highlight: true,
      minLength: 1
    },
    {
      name: 'pokemons',
      displayKey: 'name',
      source: pokemons.ttAdapter()
  })
})