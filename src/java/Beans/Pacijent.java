package Beans;
/**
 *
 * @author Sasa.Popovic
 */
public class Pacijent {
    private boolean odobreno;
    private String korIme;
    private String ime;
    private String prezime;
    private String lozinka;
    private String pol;
    private int JMBG;
    private String imeNosOsig;
    private String srodSaNos;
    private String adresa;
    private String telefon;
    private String email;
    private int idUstanova;

    public boolean isOdobreno() {
        return odobreno;
    }

    public void setOdobreno(boolean odobreno) {
        this.odobreno = odobreno;
    }

    public String getKorIme() {
        return korIme;
    }

    public void setKorIme(String korIme) {
        this.korIme = korIme;
    }
    
    public String getIme() {
        return ime;
    }

    public void setIme(String ime) {
        this.ime = ime;
    }

    public String getPrezime() {
        return prezime;
    }

    public void setPrezime(String prezime) {
        this.prezime = prezime;
    }

    public String getLozinka() {
        return lozinka;
    }

    public void setLozinka(String lozinka) {
        this.lozinka = lozinka;
    }

    public String getPol() {
        return pol;
    }

    public void setPol(String pol) {
        this.pol = pol;
    }

    public int getJMBG() {
        return JMBG;
    }

    public void setJMBG(int JMBG) {
        this.JMBG = JMBG;
    }

    public String getImeNosOsig() {
        return imeNosOsig;
    }

    public void setImeNosOsig(String imeNosOsig) {
        this.imeNosOsig = imeNosOsig;
    }

    public String getSrodSaNos() {
        return srodSaNos;
    }

    public void setSrodSaNos(String srodSaNos) {
        this.srodSaNos = srodSaNos;
    }

    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public int getIdUstanova() {
        return idUstanova;
    }

    public void setIdUstanova(int idUstanova) {
        this.idUstanova = idUstanova;
    }
   
}
