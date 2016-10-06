package Beans;
/**
 *
 * @author Sasa.Popovic
 */
public class Lekar {
    private String korIme;
    private String ime;
    private String prezime;
    private String lozinka;
    private int idOdeljenje;
    private int tip;
    private boolean nacelnik;

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

    public int getIdOdeljenje() {
        return idOdeljenje;
    }

    public void setIdOdeljenje(int idOdeljenje) {
        this.idOdeljenje = idOdeljenje;
    }

    public int getTip() {
        return tip;
    }

    public void setTip(int tip) {
        this.tip = tip;
    }

    public boolean isNacelnik() {
        return nacelnik;
    }

    public void setNacelnik(boolean nacelnik) {
        this.nacelnik = nacelnik;
    }
    
    
}
