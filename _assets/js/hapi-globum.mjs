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
 *                   - 'initiāle'
 *                     - https://en.wiktionary.org/wiki/initialis#Latin
 */
console.log('hapi-globum.mjs');

/**
 * Hapi Datum Memoriam Legendum, computandum programmi
 *
 * @see https://developer.mozilla.org/pt-BR/docs/Web/API/Window/sessionStorage
 *
 * @param {String} clavem Clāvem
 */
function HapiDatumMemoriamLegendum(clavem) {
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
function HapiDatumMemoriamScribendum(clavem, datum) {
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
function HapiDatumInterfaciemScribendum(clavem, datum) {
  console.log('HapiDatumInterfaciemScribendum', clavem, datum)
  if (datum) {
    document.body.classList.add(clavem)
  } else {
    document.body.classList.remove(clavem)
  }
}

function InterfaciemPeritumModumCheckbox() {
  console.log(this);
  console.log(this.checked);
  const textum = this.parentElement.textContent.trim();
  console.log('textum', textum)
  // let txt = null
  if (!this.checked) {
    HapiDatumMemoriamScribendum('peritum-modum-est', null)
    HapiDatumInterfaciemScribendum('peritum-modum-est', null)
  } else {
    // TODO: https://stackoverflow.com/questions/11599666/get-the-value-of-checked-checkbox
    if (confirm(textum)) {
      console.log('InterfaciemPeritumModumCheckbox: Okay')
      HapiDatumMemoriamScribendum('peritum-modum-est', 1)
      HapiDatumInterfaciemScribendum('peritum-modum-est', 1)
    } else {
      console.log('InterfaciemPeritumModumCheckbox: Non Okay')
      this.checked = false
      HapiDatumMemoriamScribendum('peritum-modum-est', null)
      HapiDatumInterfaciemScribendum('peritum-modum-est', null)
    }
  }
  // console.log(txt)
}
function initiāle() {
  const peritum = document.getElementById('peritum-modum-est')
  const toc = document.getElementById('toc')
  if (HapiDatumMemoriamLegendum('peritum-modum-est')) {
    peritum.checked = true;
    HapiDatumInterfaciemScribendum('peritum-modum-est', 1)
  }

  // https://github.com/toshimaru/jekyll-toc
  if (toc) {
    toc.querySelectorAll('a').forEach(function (el, index) {
      // console.log(el, el.href); // The element
      if (el.href.indexOf('--peritum-est') !== -1) {
        // console.log('peritum')
        el.parentElement.classList.add('peritum-est--list-item')
      }
    });

    // console.log('toc', toc)
  }

  peritum.addEventListener('click', InterfaciemPeritumModumCheckbox)
}

if (document.getElementById('peritum-modum-est')) {
  document.addEventListener("DOMContentLoaded", initiāle, false)
}
// jQuery("#peritum-modum-checkbox").on('click')
// addEventListener('click', callback)
