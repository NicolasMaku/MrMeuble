package com.source.meuble.mock;


import com.source.meuble.utilisateur.UserRole;
import com.source.meuble.webComponent.Menu;
import com.source.meuble.webComponent.Sidebar;

public class SidebarMock {
    public static final Sidebar DEFAULT_SIDEBAR =
        new Sidebar("bx bx-chair", "Mr Meuble")  // logo + nom du projet
            .withLien("/home") // Lien lorsqu'on clique sur le logo
            .addMenu(
                // Menu: Besoin
                new Menu("Besoins")
                    .withIcon("bx bx-briefcase-alt") // icon du menu: a voir sur: boxicons.com -> clique sur icon -> font -> copier la class
                    .withRoles()
                    .addSubmenu(
                        new Menu("Demande de besoin")  // Besoin (menu) -> Demande de Besoin (sous-menu du menu besoin)
                            .withIcon("bx bx-mail-send")
                            .withLien("/besoin/form")
                            .withRoles()
                    )
                    .addSubmenu(
                        new Menu("Validation Besoin") // Besoin -> Validation Besoin
                            .withIcon("bx bx-task")
                            .withLien("/besoin/liste")
                            .withRoles(UserRole.DIRECTION, UserRole.DEPT_ACHAT) // Liste des departements qui peuvent voir le menu sur leur sidebar (vide si tout les depts peut acceder)
                    )
            )
            .addMenu(
                //Menu: Achat
                new Menu("Achat")
                    .withIcon("bx bx-cart-alt")
                    .withLien("/test/layout")
                    .withRoles()
                    .addSubmenu(
                        new Menu("Proformat")
                            .withIcon("")
                            .withLien("")
                            .withRoles(UserRole.DEPT_FINANCE)
                    )
                    .addSubmenu(
                        new Menu("Bon de Commande")
                            .withIcon("bx bx-receipt")
                            .withLien("")
                            .withRoles()
                    )
                    .addSubmenu(
                        new Menu("Bon de Reception")
                            .withIcon("")
                            .withLien("")
                            .withRoles()
                    )
                    .addSubmenu(
                        new Menu("Facture Achat")
                            .withIcon("bx bx-file-blank")
                            .withLien("/achat/facture")
                    )
            )
            .addMenu(
                new Menu("Produits")
                    .withIcon("bx bx-box")
                    .addSubmenu(
                        new Menu("Saisie Produit")
                    )
                    .addSubmenu(
                        new Menu("Saisie Recette")
                    )
                    .addSubmenu(
                        new Menu("Fabrication")
                    )
            );
}
