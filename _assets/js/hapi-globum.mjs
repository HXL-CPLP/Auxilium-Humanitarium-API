/**
 * @ARCHĪVUM       _assets/js/hapi-globum.mjs
 * @LICENTIAM      Dominium publicum
 * @DĒSCRĪPTIŌNEM  _[por] Arquivo JavaScript carregado em todo site ao final
 *                        de cada página.
 *                 [por]_
 *
 *                 Trivia:
 *                   - 'Hapi'
 *                     - hapi.etica.ai
 *                   - 'datum'
 *                     - https://en.wiktionary.org/wiki/datum#Latin
 *                   - 'programmi'
 *                     - https://en.wiktionary.org/wiki/programmare#Italian
 *                   - 'computandum'
 *                     - https://en.wiktionary.org/wiki/computo#Latin
 *                   - 'inter + faciem'
 *                     - https://en.wiktionary.org/wiki/inter-#Latin
 *                     - https://en.wiktionary.org/wiki/facies#Latin
 *                   - 'memoriam'
 *                     - https://en.wiktionary.org/wiki/memoria#Latin
 *                   - 'legendum'
 *                     - https://en.wiktionary.org/wiki/scribo
 *                   - 'scrībendum'
 *                     - https://en.wiktionary.org/wiki/scribo
 */
console.log('hapi-globum.mjs');

/**
 * Hapi Datum Memoriam Legendum, computandum programmi
 *
 * @see https://developer.mozilla.org/pt-BR/docs/Web/API/Window/sessionStorage
 *
 * @param {String} clavem Clāvem
 */
function HapiDatumMemoriamLegendum (clavem) {
  return sessionStorage.getItem(clavem)
}

/**
 * Hapi Datum Memoriam Scrībendum, computandum programmi
 *
 * @see https://developer.mozilla.org/pt-BR/docs/Web/API/Window/sessionStorage
 *
 * @param {String} clavem Clāvem
 * @param {String} datum Datum
 */
function HapiDatumMemoriamScribendum (clavem, datum) {
  if (datum) {
    sessionStorage.setItem(clavem, datum)
  } else {
    sessionStorage.removeItem(clavem)
  }
}

/**
 * Hapi Datum Interfaciem Scrībendum, computandum programmi
 *
 * @see https://developer.mozilla.org/pt-BR/docs/Web/API/Window/sessionStorage
 *
 * @param {String} clavem Clāvem
 * @param {String} datum Datum
 */
function HapiDatumInterfaciemScribendum (clavem, datum) {
  if (datum) {
    document.body.classList.add(clavem)
  } else {
    document.body.classList.remove(clavem)
  }
}

function testum () {
  console.log(this);
  let txt = null

  // TODO: https://stackoverflow.com/questions/11599666/get-the-value-of-checked-checkbox
  if (confirm("? 🚧 🔎🐛🔍 🚧 ?")) {
    txt = "You pressed OK!";
    HapiDatumMemoriamScribendum('peritum-modum-est', 1)
    HapiDatumInterfaciemScribendum('peritum-modum-est')
  } else {
    txt = "You pressed Cancel!";
    HapiDatumMemoriamScribendum('peritum-modum-est', null)
    HapiDatumInterfaciemScribendum('peritum-modum-est', null)
  }
  console.log(txt)
}
function load () {
  if (HapiDatumMemoriamLegendum('peritum-modum-est')) {

  }
  console.log('loaded!');
}

// document.addEventListener("DOMContentLoaded", load, false)

if (document.getElementById('peritum-modum-est')) {
  document.addEventListener("DOMContentLoaded", load, false)
  document.getElementById('peritum-modum-est').addEventListener('click', testum)
}
// jQuery("#peritum-modum-checkbox").on('click')
// addEventListener('click', callback)
